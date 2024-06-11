
enum ChannelType{
  customerSupport,
  one2One,
  m2mChat,
  p2pChat,
  //one2ManyUnicast
}

class ChatChannel{
  
  ChatChannel({
    required this.name,
    required this.channelUUID,
    required this.channelType,
  });

  String name;
  String channelUUID;
  ChannelType channelType;

}