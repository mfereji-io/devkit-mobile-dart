//import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:async';
//import 'package:async/async.dart';

//import 'package:kaskazini/src/chat_client/client.dart';
import 'package:kaskazini/util/service_locator.dart';

part 'chat_client_conn_status_event.dart';
part 'chat_client_conn_status_state.dart';

class ChatClientConnStatusBloc
    extends Bloc<ChatClientConnStatusEvent, ChatClientConnStatusState> {
  ChatClientConnStatusBloc({
    required this.chatClient,
  }) : super(ChatClientConnInitial()) {

    chatClientConnStateSub =
        chatClient.connectionStatus.listen(
      (connStatusEvent) {
      
        switch(connStatusEvent.connStatus){

          case ConnStatus.connected:
            add(ChatClientConnectHappenedEvent());
            print("chatClientConnStateSub update with ConnStatus.connected");
          break;

          case ConnStatus.connecting:
            add(ChatClientConnectingStartedEvent());
            print("chatClientConnStateSub update with ConnStatus.connecting");
          break;

          case ConnStatus.connectionError:
            add(ChatClientConnectErrorHappenedEvent());
            print("chatClientConnStateSub update with ConnStatus.connectionError");
          break;

          case ConnStatus.disconnected:
          default:
            add(ChatClientDisConnectHappenedEvent());
            print("chatClientConnStateSub update with ConnStatus.disconnected");
          break;

        }

    });

    on<ChatClientInitRequestedEvent>((event, emit) {
      print("------------------------------------");
      print("Bloc: ChatClientInitRequestedEvent");
      //print("with chatToken: ${event.chatToken}");
      print("------------------------------------");

      chatClient.init(event.chatToken);
      emit(ChatClientConnInitialized());

    });

    on<ChatClientConnectRequestedEvent>((event, emit) {
      print("------------------------------------");
      print("Bloc: ChatClientConnectRequestedEvent");
      print("Bloc state is ${this.state}");
      print("Current chatClient.connection state is : ${chatClient.connectionStatus.toString()}");
      print("------------------------------------");

      if(this.state is !ChatClientConnected){

      //}else{

        emit(ChatClientConnecting());

        chatClient.connect(() async{
          print("..chatClient.connect processed..");
          print("..About to subscribe to channels..");
          
          chatClient.subscribe("kaskazinic");
          chatClient.subscribe("kaskazinic");
          
          /*
          chatClient.subscribe("masharikic");
          */
          print("..subscribe to channels done..");

       });
       
      }

      

      

    });

    on<ChatClientConnectHappenedEvent>((event, emit) {
      print("------------------------------------");
      print("Bloc: ChatClientConnectHappenedEvent");
      print("------------------------------------");

      //############
      
      //############

      emit(ChatClientConnected());
    });

    on<ChatClientConnectingStartedEvent>((event, emit) {
      print("------------------------------------");
      print("Bloc: ChatClientConnectingStartedEvent");
      print("------------------------------------");

      emit(ChatClientConnecting());

    });

    on<ChatClientDisConnectRequestedEvent>((event, emit) {
      print("------------------------------------");
      print("Bloc: ChatClientDisConnectRequestedEvent");
      print("------------------------------------");

      //Disconnect chat client
      this.chatClient.disconnect(() {
        print("..chat client disconnect processing..");
        //emit(ChatClientDisConnected());
       });
      
    });

    on<ChatClientDisConnectHappenedEvent>((event, emit) {
      print("------------------------------------");
      print("Bloc: ChatClientDisConnectHappenedEvent");
      print("------------------------------------");

      emit(ChatClientDisConnected());
    });

    on<ChatClientConnectErrorHappenedEvent>((event, emit) {
      print("------------------------------------");
      print("Bloc: ChatClientConnectErrorHappenedEvent");
      print("------------------------------------");

      //emit(ChatClientDisConnected());
      emit(ChatClientError());
      

    });

  }

  ChatClient chatClient;
  late StreamSubscription chatClientConnStateSub;

  @override
  Future<void> close() async {
    chatClientConnStateSub.cancel();
    chatClient.dispose();
  }

}
