import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:final_project/data_layer/chat_layer.dart';
import 'package:final_project/models/chat/model_message.dart';
import 'package:final_project/core/enum/types.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'chats_event.dart';
part 'chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  List<TextMessage> userMessages = [];
  List<ModelMessage> conversionMessages = [];
  ChatLayer chatLayer = ChatLayer();
  final currentUserAuthId = Supabase.instance.client.auth.currentUser!.id;
  String reserverAuthId = '';

  InMemoryChatController chatController = InMemoryChatController();
  ChatsBloc() : super(ChatsInitial()) {
    on<ChatsEvent>((event, emit) {});
    on<SendMessage>(sendMessage);
    on<ProviderSendMessage>(providerSendMessage);
    on<LoadMessage>(loadMessage);
    on<ProviderLoadMessage>(providerLoadMessage);
    on<ClientLoadConversion>(clientLoadConversion);
    on<ProviderLoadConversion>(providerLoadConversion);
  }

  FutureOr<void> sendMessage(
    SendMessage event,
    Emitter<ChatsState> emit,
  ) async {
    String userInput = event.userInput;
    emit(LoadingMessages());
    TextMessage? myMessage = await chatLayer.sendMessage(
      reserverAuthId: reserverAuthId,
      senderAuthId: currentUserAuthId,
      content: userInput,
      ownerType: EnumUserType.customer,
    );
    if (myMessage != null) {
      chatController.insertMessage(myMessage);
    }
    emit(SendMessageSuccessfully());
  }

  FutureOr<void> providerSendMessage(
    ProviderSendMessage event,
    Emitter<ChatsState> emit,
  ) async {
    String userInput = event.userInput;
    emit(LoadingMessages());
    TextMessage? myMessage = await chatLayer.sendMessage(
      reserverAuthId: reserverAuthId,
      senderAuthId: currentUserAuthId,
      content: userInput,
      ownerType: EnumUserType.provider,
    );
    if (myMessage != null) {
      chatController.insertMessage(myMessage);
    }
    emit(SendMessageSuccessfully());
  }

  loadMessage(LoadMessage event, Emitter<ChatsState> emit) async {
    reserverAuthId = event.authId;
    userMessages = chatLayer.getMessageWithSameAuthId(
      userType: EnumUserType.customer,
      reserverAuthId: reserverAuthId,
    );
    print(userMessages.length);
    chatController.insertAllMessages(userMessages);
    print(userMessages.length);
    emit(LoadingMessagesSuccessfully());
  }

  providerLoadMessage(
    ProviderLoadMessage event,
    Emitter<ChatsState> emit,
  ) async {
    reserverAuthId = event.authId;
    userMessages = chatLayer.getMessageWithSameAuthId(
      userType: EnumUserType.provider,
      reserverAuthId: reserverAuthId,
    );
    print(userMessages.length);
    chatController.insertAllMessages(userMessages);
    print(userMessages.length);
    emit(LoadingMessagesSuccessfully());
  }

  FutureOr<void> clientLoadConversion(
    ClientLoadConversion event,
    Emitter<ChatsState> emit,
  ) async {
    conversionMessages = await chatLayer.getUserConversions(
      userType: EnumUserType.customer,
      authId: Supabase.instance.client.auth.currentUser!.id,
    );
    emit(LoadingConversationSuccessfully());
  }

  FutureOr<void> providerLoadConversion(
    ProviderLoadConversion event,
    Emitter<ChatsState> emit,
  ) async {
    conversionMessages = await chatLayer.getUserConversions(
      authId: Supabase.instance.client.auth.currentUser!.id,

      userType: EnumUserType.provider,
    );
    emit(LoadingConversationSuccessfully());
  }
}
