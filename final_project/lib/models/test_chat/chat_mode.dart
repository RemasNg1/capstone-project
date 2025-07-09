import 'package:dart_mappable/dart_mappable.dart';

part 'chat_mode.mapper.dart';

@MappableClass()
class ChatModel with ChatModelMappable {
  @MappableField(key: 'message_id')
  final int? messageId;
  @MappableField(key: 'user_id')
  final String? userId;
  @MappableField(key: 'provider_id')
  final String? providerId;
  @MappableField(key: 'sender_type')
  final String? senderType;
  @MappableField(key: 'message_text')
  final String? messageText;
  final DateTime? timestamp;

  ChatModel({
    this.messageId,
    this.userId,
    this.providerId,
    this.senderType,
    this.messageText,
    this.timestamp,
  });
}
