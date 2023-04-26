import 'dart:async';
import 'dart:convert';

import 'package:kaskazini/util/service_locator.dart';
import 'package:mfereji/mfereji.dart' as mfereji;

import 'package:dash_chat_2/dash_chat_2.dart';

import 'package:flutter/material.dart';

class ChatClient {
  
  late mfereji.Client _client;

  StreamSubscription<mfereji.ConnectedEvent>? _connectedSub;
  StreamSubscription<mfereji.ConnectingEvent>? _connectingSub;
  StreamSubscription<mfereji.DisconnectedEvent>? _disconnSub;
  StreamSubscription<mfereji.ErrorEvent>? _errorSub;

  late StreamSubscription<mfereji.MessageEvent> _msgSub;

  late mfereji.Subscription? subscription;

  final _chatMsgController = StreamController<ChatMessage>();

  Stream<ChatMessage> get messages => _chatMsgController.stream;

  void init(
    String chatToken,
  ) {
    _client = mfereji.createClient(
      AppConfig.mferejiPresenceConnectUrl,
      mfereji.ClientConfig(
        token: chatToken,
      ),
    );

    _msgSub = _client.message.listen((event) {});
  }

  Future<void> connect(VoidCallback onConnect) async {
    _connectedSub = _client.connected.listen((event) {
      //print("Connected to mfereji chat server");
      onConnect();
    });

    _connectingSub = _client.connecting.listen((event) {
      //print("Connecting to mfereji chat server");
    });

    _disconnSub = _client.disconnected.listen((event) {
      //print("DisConnected from mfereji chat server");
    });

    _errorSub = _client.error.listen((event) {
      //print(event.error);
    });

    await _client.connect();
  }

  Future<void> subscribe(String channel) async {

    final subscription = _client.getSubscription(channel) ??
        _client.newSubscription(
          channel,
          //mfereji.SubscriptionConfig(
          //),
        );

    subscription.publication
        .map<String>((e) => utf8.decode(e.data))
        .listen((data) {
      final d = json.decode(data) as Map<String, dynamic>;
      final msg = d["message"].toString();
      final userId = d["user_id"].toString();
      final userFirstName = d["user_firstname"].toString();
      final userLastName = d["user_lastname"].toString();

      _chatMsgController.sink.add(
        ChatMessage(
          createdAt: DateTime.now(),
          text: msg,
          user: ChatUser(
              id: userId, firstName: userFirstName, lastName: userLastName),
        ),
      );
    });

    subscription.join.listen(print);
    subscription.leave.listen(print);

    subscription.subscribed.listen(print);
    subscription.subscribing.listen(print);
    subscription.unsubscribed.listen(print);
    subscription.error.listen(print);

    this.subscription = subscription;
    await subscription.subscribe();
  }

  Future<void> dispose() async {
    await _connectingSub?.cancel();
    await _connectedSub?.cancel();
    await _disconnSub?.cancel();
    await _errorSub?.cancel();
    await _msgSub.cancel();
    await _msgSub.cancel();
    await _chatMsgController.close();
  }

  Future<void> sendMsg(ChatMessage msg) async {
    final output = jsonEncode({
      'message': msg.text,
      'user_id': msg.user.id,
      'user_firstname': msg.user.firstName,
      'user_lastname': msg.user.lastName,
    });

    final data = utf8.encode(output);

    try {
      await subscription?.publish(data);
    } on Exception {
      rethrow;
    }
  }
}
