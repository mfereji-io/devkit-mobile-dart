import 'package:flutter/material.dart';
import 'package:kaskazini/util/service_locator.dart';

final AuthenticationBloc authBloc = GetIt.instance<AuthenticationBloc>();
//final AppRouter appRouter = GetIt.instance<AppRouter>();

/*
final ChatClientConnStatusBloc chatClientConnStatusBloc =
    GetIt.instance<ChatClientConnStatusBloc>();
*/

// ignore: must_be_immutable
class ChatHomePage extends StatelessWidget {
  ChatHomePage({Key? key}) : super(key: key);

  //final AuthenticationBloc authBloc = GetIt.instance<AuthenticationBloc>();
  String userId = authBloc.state.authenticatedUser.id;
  //String username = authBloc.state.authenticatedUser.username;
  String firstname = authBloc.state.authenticatedUser.firstname;
  //String lastname = authBloc.state.authenticatedUser.lastname;

  //Mfereji credentials
  //String chatToken = authBloc.state.authenticatedUser.chatToken;
  //String mferejiAppId = authBloc.state.authenticatedUser.chatAppId;

  final Color indicatorColorConnecting = Color.fromRGBO(206, 139, 15, 1);
  final Color indicatorColorConnected = Color.fromRGBO(12, 185, 9, 1);
  final Color indicatorColorDisconnected = Color.fromRGBO(73, 74, 70, 1);
  final Color indicatorColorConnectionError = Color.fromRGBO(241, 2, 2, 1);
  final Color gIndicatorColor = Color.fromRGBO(27, 122, 106, 1);

  String indicatorTextConnecting = 'Connecting';
  String indicatorTextConnected = 'Connected';
  String indicatorTextDisconnected = 'Disconnected';
  String indicatorTextConnectionError = 'Connection Error';

  final AppRouter appRouter = GetIt.instance<AppRouter>();


  
  @override
  Widget build(BuildContext context) {

    /*
    ChatListingRepository chatListingRepository = GetIt.instance<ChatListingRepository>();
    final userChatChannels = chatListingRepository.getUserChannelListing(currentUserUUID:userId);
    */

    chatClientConnStatusBloc.add(ChatClientConnectRequestedEvent());
    

    return Container(    
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$firstname, welcome to chat support, ",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Container(
            //Overall Connection state
            child: Center(
              child: BlocConsumer<ChatClientConnStatusBloc,
                  ChatClientConnStatusState>(
                bloc: chatClientConnStatusBloc,
                listenWhen: (previous, current) {
                  if (previous != current) {
                    return true;
                  }
                  return false;
                },
                listener: (context, state) {
                  //Do stuff
                  print("Page: listener: ChatClientConnStatusState state is $state");
                },
                buildWhen: (previous, current) {
                  if (previous != current) {
                    return true;
                  }
                  return false;
                },
                builder: (context, state) {
                  
                  //Return stuff
                  Color indicatorColor = indicatorColorDisconnected;
                  String indicatorText = indicatorTextDisconnected;
                  
                  if (state == const ChatClientConnected()) {

                    indicatorColor = indicatorColorConnected;
                    indicatorText = indicatorTextConnected;
                    
                  } else if (state == const ChatClientConnecting()) {
                    
                    indicatorColor = indicatorColorConnecting;
                    indicatorText = indicatorTextConnecting;

                  } else if (state == const ChatClientError()) {

                    indicatorColor = indicatorColorConnectionError;
                    indicatorText = indicatorTextConnectionError;

                  } 
                  
                  return Container(
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                              //color: gIndicatorColor,
                              border: Border.all(
                                color: indicatorColor,
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text(indicatorText, 
                        )),
                      ),
                    ],
                  ));

                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
              //Customer Care Channel state
              ),
          const SizedBox(height: 20),
          Container(
           child: Column(
            children: [

              GestureDetector(
                onTap: (){
                  appRouter.navigate(ChatRoute());
                },
                child: ListTile(
                  title: Text("Kaskazini Member group"),
                  subtitle: Text("Kaskazini Member chat"),
                  leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: Container(
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(25),
                                ),
                                color: gIndicatorColor,
                                border: Border.all(
                                  //color: indicatorColorConnected,
                                  width: 3,
                                ),
                              ),
                              child: const Center(
                                child: Text("K",
                                  style: TextStyle( 
                                    fontWeight: FontWeight.w800,
                                    fontSize: 18,
                                    color: Color.fromRGBO(255, 255, 255, 1)
                                  )
                                ),
                              ),
                            )
                  ),
                  
                  trailing: SizedBox(
                    height: 50,
                    width: 50,
                    child: Container(
              
                    ),
                  ),
              
                ),
              )


              
              
            ],
           )
              ),
        ],
      ),
    );
  }
}
