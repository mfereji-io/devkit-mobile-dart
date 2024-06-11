import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kaskazini/util/service_locator.dart';

import 'package:dash_chat_2/dash_chat_2.dart';

//final AuthenticationBloc authBloc = GetIt.instance<AuthenticationBloc>();

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  
  final ChatClient chatClient = ChatClient();

  String userId = authBloc.state.authenticatedUser.id;
  String username = authBloc.state.authenticatedUser.username;
  String firstname = authBloc.state.authenticatedUser.firstname;
  String lastname = authBloc.state.authenticatedUser.lastname;

  //Mfereji credentials
  String chatToken = authBloc.state.authenticatedUser.chatToken;
  String mferejiAppId = authBloc.state.authenticatedUser.chatAppId;

  final AppRouter appRouter = GetIt.instance<AppRouter>();

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late StreamSubscription<ChatMessage> _sub;

  bool isConnected = false;

  List<ChatMessage> messages = <ChatMessage>[];

  @override
  void initState() {
    try {

      widget.chatClient
        ..init(widget.chatToken)
        ..connect(() async {});

      widget.chatClient.subscribe("kaskazinic");
      //widget.chatClient.subscribe("masharikic");

      _sub = widget.chatClient.messages
          .listen((msg) => setState(() => messages.insert(0, msg)));

      super.initState();
      isConnected = true;
    
    } catch (exception) {
      //print("could not connect to mfereji presence server: ${exception.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {

    ChatUser user = ChatUser(
      id: widget.userId,
      firstName: widget.firstname,
      lastName: widget.lastname,
    );

    if (isConnected) {
      //TODO: Pull in older messages from server

      return Container(

        //color: const Color.fromARGB(47, 39, 180, 20),
        child: DashChat(
          currentUser: user,
          onSend: (ChatMessage m) {
            widget.chatClient.sendMsg(m);
          },
          messages: messages,
        ),
      );
    } 
    else {
      return Container(
        child: Text("Currently disconnected from mfereji chat service"),
      );
    }
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    super.dispose;
    await _sub.cancel();
    
  }
}
