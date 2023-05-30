part of 'chat_client_conn_status_bloc.dart';

@immutable
abstract class ChatClientConnStatusEvent {
   
}

class ChatClientInitRequestedEvent extends ChatClientConnStatusEvent {
  ChatClientInitRequestedEvent({required this.chatToken});

  final String chatToken;
}

class ChatClientConnectRequestedEvent extends ChatClientConnStatusEvent {}

class ChatClientConnectingStartedEvent extends ChatClientConnStatusEvent {}

class ChatClientConnectHappenedEvent extends ChatClientConnStatusEvent {}

class ChatClientDisConnectRequestedEvent extends ChatClientConnStatusEvent {}

class ChatClientDisConnectHappenedEvent extends ChatClientConnStatusEvent {}

class ChatClientConnectErrorHappenedEvent extends ChatClientConnStatusEvent {}