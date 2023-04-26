import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kaskazini/util/service_locator.dart';

import 'package:mfereji/mfereji.dart' as mfereji;
import 'package:dash_chat_2/dash_chat_2.dart';

final AuthenticationBloc authBloc = GetIt.instance<AuthenticationBloc>();
final AppRouter appRouter = GetIt.instance<AppRouter>();

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  final ChatClient cli = ChatClient();

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  
  late StreamSubscription<ChatMessage> _sub;

  bool isConnected = false;

  List<ChatMessage> messages = <ChatMessage>[];

  @override
  void initState() {
    if (authBloc.state is AuthenticationAuthenticated) {

      String username = authBloc.state.authenticatedUser.username;
      String chatToken = authBloc.state.authenticatedUser.chatToken;

      try {

        widget.cli
        ..init(chatToken)
        ..connect(() async {
          //print("connected to mfereji presence server");
        });

      widget.cli.subscribe("kaskazinic");

      
      _sub = widget.cli.messages.listen(
          (msg) => setState(
            () => messages.insert(0, msg)
          )
        );
      

      super.initState();
      isConnected = true;

      } catch (exception) {
        print("could not connect to mfereji presence server: ${exception.toString()}");
        
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        bloc: authBloc,
        listener: (context, state) {
          if (state is AuthenticationUnauthenticated) {
            appRouter.replace(AuthLoginRoute());
          }
        },
        builder: (context, state) {
            
            String username = state.authenticatedUser.username;
            String chatToken = state.authenticatedUser.chatToken;
            String mferejiAppId = state.authenticatedUser.chatAppId;
            //String mferejiAppId = "72303f7f-bcbb-428f-9314-21a6e2d7061c";

            ChatUser user = ChatUser(
              id: state.authenticatedUser.id,
              firstName: state.authenticatedUser.firstname,
              lastName: state.authenticatedUser.lastname,
            );

            if (isConnected) {

              //TODO: Pull in older messages from server

              return Container(
                child: DashChat(
                  currentUser: user,
                  onSend: (ChatMessage m) {
                    //push to mfereji chat-api
                    widget.cli.sendMsg(m);
                    /*
                    setState(() {
                      //messages.insert(0, m);
                    });
                    */
                  },
                  messages: messages,
                ),
              );
            } else {
              return Container(
                child: Text("Currently disconnected"),
              );
            }

        });
  }

  @override
  Future<void> dispose() async {
    await _sub.cancel();
    super.dispose;
  }
  
}
