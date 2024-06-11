part of 'chat_client_conn_status_bloc.dart';

@immutable
abstract class ChatClientConnStatusState extends Equatable {
  const ChatClientConnStatusState();
  /*
  ChatClientConnStatusState({required this.chatClient,});

  @override 
  final  ChatClient chatClient;
  */
  @override
  List<Object> get props => [];
}

class ChatClientConnInitial extends ChatClientConnStatusState {
  const ChatClientConnInitial();
  /*
  ChatClientConnInitial({required this.chatClient,}): super(chatClient: chatClient);

  @override 
  final ChatClient chatClient;
  */

  @override
  List<Object> get props => [];

}

class ChatClientConnInitialized extends ChatClientConnStatusState {
  const ChatClientConnInitialized();

  @override
  List<Object> get props => [];
}

class ChatClientConnecting extends ChatClientConnStatusState {
  const ChatClientConnecting();

  @override
  List<Object> get props => [];
}

class ChatClientConnected extends ChatClientConnStatusState {
  const ChatClientConnected();

  @override
  List<Object> get props => [];
}

//class ChatClientDisConnecting extends ChatClientConnStatusState {}

class ChatClientDisConnected extends ChatClientConnStatusState {
  const ChatClientDisConnected();
  
  @override
  List<Object> get props => [];
}

class ChatClientError extends ChatClientConnStatusState {
  const ChatClientError();
  
  @override
  List<Object> get props => [];
}
