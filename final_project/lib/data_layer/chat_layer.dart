import 'dart:math';

import 'package:final_project/core/enum/types.dart';
import 'package:final_project/models/chat/model_message.dart';
import 'package:final_project/repo/chat.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ChatLayer {
  static List<ModelMessage> allUserConversions = [];
  static List<ModelMessage> conversionMessages = [];
  static List<TextMessage> userMessages = [];

  getUserConversions({required EnumUserType userType}) async {
    // get all user message list of TextMessage
    var data = await Chat.loadChats(userType: userType);
    // save all user conversions
    allUserConversions = List.from(
      data ?? [],
    ).map((item) => ModelMessage.fromJson(item)).toList();
    print("getUserConversions ${allUserConversions.length}");

    // make convertion list to take only one message from each conversion
    if (allUserConversions.isNotEmpty) {
      conversionMessages = getAllAuthIds(
        messages: allUserConversions,
        userType: userType,
      );
    }
    return conversionMessages;
  }

  // convert all user message as list of TextMessage
  List<TextMessage> getMessageWithSameAuthId({
    required EnumUserType userType,
    required String reserverAuthId,
  }) {
    userMessages = [];
    print(
      "getMessageWithSameAuthId+++++++++++++++ ${allUserConversions.length}",
    );
    userMessages = allUserConversions
        .where((item) {
          return userType == EnumUserType.customer
              ? item.providerAuthId == reserverAuthId
              : item.userAuthId == reserverAuthId;
        })
        .map((item) {
          return makeTextMessage(
            content: item.content!,
            authorId: item.owner == EnumUserType.customer.name
                ? item.userAuthId!
                : item.providerAuthId!,
          );
        })
        .toList();
    return userMessages;
  }

  Future<TextMessage?> sendMessage({
    required String reserverAuthId,
    required String senderAuthId,
    required String content,
    required EnumUserType ownerType,
  }) async {
    ModelMessage newMessage = ModelMessage(
      content: content,
      // if owner type is customer that mean senderAuthId is  userAuthId else reserverAuthId is userAuthId.
      userAuthId: ownerType == EnumUserType.customer
          ? senderAuthId
          : reserverAuthId,

      // if owner type is customer that mean senderAuthId is  providerAuthId else reserverAuthId is providerAuthId.
      providerAuthId: ownerType == EnumUserType.customer
          ? reserverAuthId
          : senderAuthId,
      owner: ownerType.name,
      status: EnumChatStatus.send.name,
      date: DateTime.now().toString(),
    );

    // print(newMessage.toJson());
    var result = await Chat.sendChat(userType: ownerType, message: newMessage);
    if (result == null) {
      allUserConversions.add(newMessage);
      return makeTextMessage(content: content, authorId: senderAuthId);
    }
    print("sendMessage chat layer $result");
    return null;
  }

  List<ModelMessage> getAllAuthIds({
    required List<ModelMessage> messages,
    required EnumUserType userType,
  }) {
    List<ModelMessage> conversationList = [];
    Set<String> seenUserIds = {};
    for (var message in messages) {
      if (!seenUserIds.contains(
        userType == EnumUserType.customer
            ? message.providerAuthId
            : message.userAuthId,
      )) {
        conversationList.add(message);
        seenUserIds.add(
          userType == EnumUserType.customer
              ? message.providerAuthId!
              : message.userAuthId!,
        );
      }
    }
    return conversationList;
  }

  TextMessage makeTextMessage({
    required String content,
    required String authorId,
  }) {
    TextMessage textMessage = TextMessage(
      createdAt: DateTime.now(),
      id: '${Random().nextInt(1000) + 1}',
      authorId: authorId,
      text: content,
    );

    return textMessage;
  }
}
