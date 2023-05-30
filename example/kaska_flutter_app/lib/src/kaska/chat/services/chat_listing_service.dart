import 'dart:convert';
import 'dart:async';
import 'package:kaskazini/util/service_locator.dart';

class ChatListingService {
  ChatListingService();

  late final String currentUserUUID;
  String? currentPageNum = "0";

  //Future< List< Map<String, dynamic>> >  getHomeChannels() async{
  Future< List<ChatChannel>>  getUserHomeCHannels({required String userUUID, String? pageNum="0"}) async {

      currentUserUUID = userUUID;
      currentPageNum = pageNum;

      try {

        List<ChatChannel> x = [];

        x.add(
          ChatChannel(
            name: 'kaskazinic',
            channelUUID: 'KZ203f7f-bcbb-428f-9314-21a6e2d70619',
            channelType: ChannelType.customerSupport,
          ));

        x.add(
          ChatChannel(
            name: 'masharikic',
            channelUUID: 'KZ303f7f-bcbb-428f-9314-21a6e2d70619',
            channelType: ChannelType.customerSupport,
          ));

        return x;



      } catch (e) {
        rethrow;
      }
  }
  
}