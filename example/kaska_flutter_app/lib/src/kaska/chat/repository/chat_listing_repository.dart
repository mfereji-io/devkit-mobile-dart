import 'dart:async';
import 'package:kaskazini/util/service_locator.dart';

class ChatListingRepository {
  
  ChatListingRepository({required this.chatListingService});

  final ChatListingService chatListingService;

  Future<List<ChatChannel>> getUserChannelListing({required String currentUserUUID, String? pageNum}) async {

    List<ChatChannel> x = await chatListingService.getUserHomeCHannels(
      userUUID:currentUserUUID,
      pageNum: pageNum);

    return x;

  }

}