
import 'package:final_project/models/temp_bookin/provider_temp_model.dart';
import 'package:final_project/models/temp_bookin/user_temp_model.dart';
import 'package:final_project/core/enum/types.dart';
class MessageTempModel {
  final int id;
  final ProviderTempModel provider;
  final UserTempModel user;
  final String content;
  final DateTime date;
  final EnumChatStatus status;
  final EnumUserType authorType;

  MessageTempModel({
    required this.id,
    required this.provider,
    required this.user,
    required this.content,
    required this.date,
    required this.status,
    required this.authorType,
  });
}

// demo of messages
List<MessageTempModel> messages = [
  MessageTempModel(
    id: 1,
    provider: providers[0],
    user: users[0],
    content: "I know someone who can do it for you",
    date: DateTime.now(),
    status: EnumChatStatus.send,
    authorType: EnumUserType.user,
  ),
  MessageTempModel(
    id: 33,
    provider: providers[0],
    user: users[0],
    content: "I aaaae who can do it for you",
    date: DateTime.now(),
    status: EnumChatStatus.send,
    authorType: EnumUserType.user,
  ),
  MessageTempModel(
    id: 44,
    provider: providers[0],
    user: users[0],
    content: "I knoasdf you",
    date: DateTime.now(),
    status: EnumChatStatus.send,
    authorType: EnumUserType.user,
  ),
  MessageTempModel(
    id: 55,
    provider: providers[0],
    user: users[0],
    content: "provider",
    date: DateTime.now(),
    status: EnumChatStatus.send,
    authorType: EnumUserType.provider,
  ),
  MessageTempModel(
    id: 2,
    provider: providers[0],
    user: users[1],
    content: "I can help with that!",
    date: DateTime.now(),
    status: EnumChatStatus.send,
    authorType: EnumUserType.user,
  ),
  MessageTempModel(
    id: 3,
    provider: providers[0],
    user: users[2],
    content: "Sounds good to me.",
    date: DateTime.now(),
    status: EnumChatStatus.send,
    authorType: EnumUserType.user,
  ),
  MessageTempModel(
    id: 4,
    provider: providers[0],
    user: users[3],
    content: "Let’s schedule a meeting.",
    date: DateTime.now(),
    status: EnumChatStatus.send,
    authorType: EnumUserType.user,
  ),
  MessageTempModel(
    id: 5,
    provider: providers[0],
    user: users[4],
    content: "I'll get back to you shortly.",
    date: DateTime.now(),
    status: EnumChatStatus.send,
    authorType: EnumUserType.user,
  ),
  MessageTempModel(
    id: 6,
    provider: providers[0],
    user: users[5],
    content: "Great, thank you!",
    date: DateTime.now(),
    status: EnumChatStatus.send,
    authorType: EnumUserType.user,
  ),
  MessageTempModel(
    id: 7,
    provider: providers[0],
    user: users[6],
    content: "I'm not sure, let me check.",
    date: DateTime.now(),
    status: EnumChatStatus.send,
    authorType: EnumUserType.user,
  ),
  MessageTempModel(
    id: 8,
    provider: providers[0],
    user: users[7],
    content: "Absolutely, I’ll handle it.",
    date: DateTime.now(),
    status: EnumChatStatus.send,
    authorType: EnumUserType.user,
  ),
];
