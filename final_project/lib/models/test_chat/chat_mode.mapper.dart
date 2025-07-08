// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'chat_mode.dart';

class ChatModelMapper extends ClassMapperBase<ChatModel> {
  ChatModelMapper._();

  static ChatModelMapper? _instance;
  static ChatModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChatModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ChatModel';

  static int? _$messageId(ChatModel v) => v.messageId;
  static const Field<ChatModel, int> _f$messageId =
      Field('messageId', _$messageId, key: r'message_id', opt: true);
  static String? _$userId(ChatModel v) => v.userId;
  static const Field<ChatModel, String> _f$userId =
      Field('userId', _$userId, key: r'user_id', opt: true);
  static String? _$providerId(ChatModel v) => v.providerId;
  static const Field<ChatModel, String> _f$providerId =
      Field('providerId', _$providerId, key: r'provider_id', opt: true);
  static String? _$senderType(ChatModel v) => v.senderType;
  static const Field<ChatModel, String> _f$senderType =
      Field('senderType', _$senderType, key: r'sender_type', opt: true);
  static String? _$messageText(ChatModel v) => v.messageText;
  static const Field<ChatModel, String> _f$messageText =
      Field('messageText', _$messageText, key: r'message_text', opt: true);
  static DateTime? _$timestamp(ChatModel v) => v.timestamp;
  static const Field<ChatModel, DateTime> _f$timestamp =
      Field('timestamp', _$timestamp, opt: true);

  @override
  final MappableFields<ChatModel> fields = const {
    #messageId: _f$messageId,
    #userId: _f$userId,
    #providerId: _f$providerId,
    #senderType: _f$senderType,
    #messageText: _f$messageText,
    #timestamp: _f$timestamp,
  };

  static ChatModel _instantiate(DecodingData data) {
    return ChatModel(
        messageId: data.dec(_f$messageId),
        userId: data.dec(_f$userId),
        providerId: data.dec(_f$providerId),
        senderType: data.dec(_f$senderType),
        messageText: data.dec(_f$messageText),
        timestamp: data.dec(_f$timestamp));
  }

  @override
  final Function instantiate = _instantiate;

  static ChatModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChatModel>(map);
  }

  static ChatModel fromJson(String json) {
    return ensureInitialized().decodeJson<ChatModel>(json);
  }
}

mixin ChatModelMappable {
  String toJson() {
    return ChatModelMapper.ensureInitialized()
        .encodeJson<ChatModel>(this as ChatModel);
  }

  Map<String, dynamic> toMap() {
    return ChatModelMapper.ensureInitialized()
        .encodeMap<ChatModel>(this as ChatModel);
  }

  ChatModelCopyWith<ChatModel, ChatModel, ChatModel> get copyWith =>
      _ChatModelCopyWithImpl<ChatModel, ChatModel>(
          this as ChatModel, $identity, $identity);
  @override
  String toString() {
    return ChatModelMapper.ensureInitialized()
        .stringifyValue(this as ChatModel);
  }

  @override
  bool operator ==(Object other) {
    return ChatModelMapper.ensureInitialized()
        .equalsValue(this as ChatModel, other);
  }

  @override
  int get hashCode {
    return ChatModelMapper.ensureInitialized().hashValue(this as ChatModel);
  }
}

extension ChatModelValueCopy<$R, $Out> on ObjectCopyWith<$R, ChatModel, $Out> {
  ChatModelCopyWith<$R, ChatModel, $Out> get $asChatModel =>
      $base.as((v, t, t2) => _ChatModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChatModelCopyWith<$R, $In extends ChatModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? messageId,
      String? userId,
      String? providerId,
      String? senderType,
      String? messageText,
      DateTime? timestamp});
  ChatModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChatModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChatModel, $Out>
    implements ChatModelCopyWith<$R, ChatModel, $Out> {
  _ChatModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChatModel> $mapper =
      ChatModelMapper.ensureInitialized();
  @override
  $R call(
          {Object? messageId = $none,
          Object? userId = $none,
          Object? providerId = $none,
          Object? senderType = $none,
          Object? messageText = $none,
          Object? timestamp = $none}) =>
      $apply(FieldCopyWithData({
        if (messageId != $none) #messageId: messageId,
        if (userId != $none) #userId: userId,
        if (providerId != $none) #providerId: providerId,
        if (senderType != $none) #senderType: senderType,
        if (messageText != $none) #messageText: messageText,
        if (timestamp != $none) #timestamp: timestamp
      }));
  @override
  ChatModel $make(CopyWithData data) => ChatModel(
      messageId: data.get(#messageId, or: $value.messageId),
      userId: data.get(#userId, or: $value.userId),
      providerId: data.get(#providerId, or: $value.providerId),
      senderType: data.get(#senderType, or: $value.senderType),
      messageText: data.get(#messageText, or: $value.messageText),
      timestamp: data.get(#timestamp, or: $value.timestamp));

  @override
  ChatModelCopyWith<$R2, ChatModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ChatModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
