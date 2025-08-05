// import 'dart:async';
// import 'dart:developer';

// import 'package:bloc/bloc.dart';
// import 'package:final_project/data_layer/chat_layer.dart';
// import 'package:final_project/models/chat/model_message.dart';
// import 'package:final_project/core/enum/types.dart';
// import 'package:flutter_chat_core/flutter_chat_core.dart';
// import 'package:hive/hive.dart';
// import 'package:meta/meta.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// part 'chats_event.dart';
// part 'chats_state.dart';

// class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
//   List<TextMessage> userMessages = [];
//   List<ModelMessage> conversionMessages = [];
//   ChatLayer chatLayer = ChatLayer();
//   final currentUserAuthId = Supabase.instance.client.auth.currentUser!.id;
//   String reserverAuthId = '';
//   Box get box => Hive.box('userInfo');
//   String? get userTypeString => box.get('userType');
//   StreamSubscription? messageSubscription;

//   InMemoryChatController chatController = InMemoryChatController();
//   ChatsBloc() : super(ChatsInitial()) {
//     on<ChatsEvent>((event, emit) {});
//     on<SendMessage>(sendMessage);
//     on<ProviderSendMessage>(providerSendMessage);
//     on<LoadMessage>(loadMessage);
//     on<ProviderLoadMessage>(providerLoadMessage);
//     on<ClientLoadConversion>(clientLoadConversion);
//     on<ProviderLoadConversion>(providerLoadConversion);
//   }

//   FutureOr<void> sendMessage(
//     SendMessage event,
//     Emitter<ChatsState> emit,
//   ) async {
//     String userInput = event.userInput;
//     emit(LoadingMessages());
//     TextMessage? myMessage = await chatLayer.sendMessage(
//       reserverAuthId: reserverAuthId,
//       senderAuthId: currentUserAuthId,
//       content: userInput,
//       ownerType: EnumUserType.customer,
//     );
//     if (myMessage != null) {
//       chatController.insertMessage(myMessage);
//     }
//     emit(SendMessageSuccessfully());
//   }

//   FutureOr<void> providerSendMessage(
//     ProviderSendMessage event,
//     Emitter<ChatsState> emit,
//   ) async {
//     String userInput = event.userInput;
//     emit(LoadingMessages());
//     TextMessage? myMessage = await chatLayer.sendMessage(
//       reserverAuthId: reserverAuthId,
//       senderAuthId: currentUserAuthId,
//       content: userInput,
//       ownerType: EnumUserType.provider,
//     );
//     if (myMessage != null) {
//       chatController.insertMessage(myMessage);
//     }
//     emit(SendMessageSuccessfully());
//   }

//   loadMessage(LoadMessage event, Emitter<ChatsState> emit) async {
//     reserverAuthId = event.authId;
//     userMessages = chatLayer.getMessageWithSameAuthId(
//       userType: EnumUserType.customer,
//       reserverAuthId: reserverAuthId,
//     );
//     print(userMessages.length);
//     chatController.insertAllMessages(userMessages);
//     print(userMessages.length);
//     emit(LoadingMessagesSuccessfully());
//   }

//   providerLoadMessage(
//     ProviderLoadMessage event,
//     Emitter<ChatsState> emit,
//   ) async {
//     reserverAuthId = event.authId;
//     userMessages = chatLayer.getMessageWithSameAuthId(
//       userType: EnumUserType.provider,
//       reserverAuthId: reserverAuthId,
//     );
//     print(userMessages.length);
//     chatController.insertAllMessages(userMessages);
//     print(userMessages.length);
//     emit(LoadingMessagesSuccessfully());
//   }

//   FutureOr<void> clientLoadConversion(
//     ClientLoadConversion event,
//     Emitter<ChatsState> emit,
//   ) async {
//     if (userTypeString == EnumUserType.guest.name) {
//       log("Guest");
//       emit(UserLoggedInAsAnonymousState());
//       return;
//     }
//     conversionMessages = await chatLayer.getUserConversions(
//       userType: EnumUserType.customer,
//       authId: Supabase.instance.client.auth.currentUser!.id,
//     );
//     emit(LoadingConversationSuccessfully());
//   }

//   FutureOr<void> providerLoadConversion(
//     ProviderLoadConversion event,
//     Emitter<ChatsState> emit,
//   ) async {
//     conversionMessages = await chatLayer.getUserConversions(
//       authId: Supabase.instance.client.auth.currentUser!.id,

//       userType: EnumUserType.provider,
//     );
//     emit(LoadingConversationSuccessfully());
//   }

// }

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:final_project/data_layer/chat_layer.dart';
import 'package:final_project/models/chat/model_message.dart';
import 'package:final_project/core/enum/types.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:hive/hive.dart';
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
  Box get box => Hive.box('userInfo');
  String? get userTypeString => box.get('userType');
  StreamSubscription? messageSubscription;

  InMemoryChatController chatController = InMemoryChatController();

  ChatsBloc() : super(ChatsInitial()) {
    on<ChatsEvent>((event, emit) {});
    on<SendMessage>(sendMessage);
    on<ProviderSendMessage>(providerSendMessage);
    on<LoadMessage>(loadMessage);
    on<ProviderLoadMessage>(providerLoadMessage);
    on<ClientLoadConversion>(clientLoadConversion);
    on<ProviderLoadConversion>(providerLoadConversion);
    on<UpdateConversationList>((event, emit) {
      emit(LoadingConversationSuccessfully());
    });
  }

  FutureOr<void> sendMessage(
    SendMessage event,
    Emitter<ChatsState> emit,
  ) async {
    String userInput = event.userInput;
    emit(LoadingMessages());

    await chatLayer.sendMessage(
      reserverAuthId: reserverAuthId,
      senderAuthId: currentUserAuthId,
      content: userInput,
      ownerType: EnumUserType.customer,
    );

    emit(SendMessageSuccessfully());
  }

  FutureOr<void> providerSendMessage(
    ProviderSendMessage event,
    Emitter<ChatsState> emit,
  ) async {
    String userInput = event.userInput;
    emit(LoadingMessages());

    await chatLayer.sendMessage(
      reserverAuthId: reserverAuthId,
      senderAuthId: currentUserAuthId,
      content: userInput,
      ownerType: EnumUserType.provider,
    );

    emit(SendMessageSuccessfully());
  }

  // FutureOr<void> sendMessage(
  //   SendMessage event,
  //   Emitter<ChatsState> emit,
  // ) async {
  //   String userInput = event.userInput;
  //   emit(LoadingMessages());
  //   TextMessage? myMessage = await chatLayer.sendMessage(
  //     reserverAuthId: reserverAuthId,
  //     senderAuthId: currentUserAuthId,
  //     content: userInput,
  //     ownerType: EnumUserType.customer,
  //   );
  //   if (myMessage != null) {
  //     chatController.insertMessage(myMessage);
  //   }
  //   emit(SendMessageSuccessfully());
  // }

  // FutureOr<void> providerSendMessage(
  //   ProviderSendMessage event,
  //   Emitter<ChatsState> emit,
  // ) async {
  //   String userInput = event.userInput;
  //   emit(LoadingMessages());
  //   TextMessage? myMessage = await chatLayer.sendMessage(
  //     reserverAuthId: reserverAuthId,
  //     senderAuthId: currentUserAuthId,
  //     content: userInput,
  //     ownerType: EnumUserType.provider,
  //   );
  //   if (myMessage != null) {
  //     chatController.insertMessage(myMessage);
  //   }
  //   emit(SendMessageSuccessfully());
  // }

  Future<void> loadMessage(LoadMessage event, Emitter<ChatsState> emit) async {
    reserverAuthId = event.authId;
    userMessages = chatLayer.getMessageWithSameAuthId(
      userType: EnumUserType.customer,
      reserverAuthId: reserverAuthId,
    );

    chatController.insertAllMessages(userMessages);
    setupRealtimeListener(EnumUserType.customer);
    emit(LoadingMessagesSuccessfully());
  }

  Future<void> providerLoadMessage(
    ProviderLoadMessage event,
    Emitter<ChatsState> emit,
  ) async {
    reserverAuthId = event.authId;
    userMessages = chatLayer.getMessageWithSameAuthId(
      userType: EnumUserType.provider,
      reserverAuthId: reserverAuthId,
    );
    userMessages.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));

    chatController.insertAllMessages(userMessages);
    setupRealtimeListener(EnumUserType.provider);
    emit(LoadingMessagesSuccessfully());
  }

  // FutureOr<void> clientLoadConversion(
  //   ClientLoadConversion event,
  //   Emitter<ChatsState> emit,
  // ) async {
  //   if (userTypeString == EnumUserType.guest.name) {
  //     log("Guest");
  //     emit(UserLoggedInAsAnonymousState());
  //     return;
  //   }
  //   conversionMessages = await chatLayer.getUserConversions(
  //     userType: EnumUserType.customer,
  //     authId: currentUserAuthId,
  //   );
  //   emit(LoadingConversationSuccessfully());
  // }

  FutureOr<void> clientLoadConversion(
    ClientLoadConversion event,
    Emitter<ChatsState> emit,
  ) async {
    if (userTypeString == EnumUserType.guest.name) {
      emit(UserLoggedInAsAnonymousState());
      return;
    }

    conversionMessages = await chatLayer.getUserConversions(
      userType: EnumUserType.customer,
      authId: currentUserAuthId,
    );

    setupRealtimeListenerForConversations(EnumUserType.customer);

    emit(LoadingConversationSuccessfully());
  }

  FutureOr<void> providerLoadConversion(
    ProviderLoadConversion event,
    Emitter<ChatsState> emit,
  ) async {
    conversionMessages = await chatLayer.getUserConversions(
      authId: currentUserAuthId,
      userType: EnumUserType.provider,
    );

    setupRealtimeListenerForConversations(EnumUserType.provider);

    emit(LoadingConversationSuccessfully());
  }

  // FutureOr<void> providerLoadConversion(
  //   ProviderLoadConversion event,
  //   Emitter<ChatsState> emit,
  // ) async {
  //   conversionMessages = await chatLayer.getUserConversions(
  //     authId: currentUserAuthId,
  //     userType: EnumUserType.provider,
  //   );
  //   emit(LoadingConversationSuccessfully());
  // }

  void setupRealtimeListener(EnumUserType userType) {
    messageSubscription?.cancel();
    messageSubscription = ChatLayer.listenToMessages().listen((data) {
      final newMessage = ModelMessage.fromJson(data);

      final isForCurrentUser = userType == EnumUserType.customer
          ? newMessage.userAuthId == currentUserAuthId &&
                newMessage.providerAuthId == reserverAuthId
          : newMessage.providerAuthId == currentUserAuthId &&
                newMessage.userAuthId == reserverAuthId;

      if (isForCurrentUser) {
        final textMsg = chatLayer.makeTextMessage(
          content: newMessage.content!,
          authorId: newMessage.owner == EnumUserType.customer.name
              ? newMessage.userAuthId!
              : newMessage.providerAuthId!,
          createdAt: newMessage.date ?? DateTime.now(),
        );

        chatController.insertMessage(textMsg);
      }
    });
  }

  @override
  Future<void> close() {
    messageSubscription?.cancel();
    return super.close();
  }

  void setupRealtimeListenerForConversations(EnumUserType userType) {
    messageSubscription?.cancel();
    messageSubscription = ChatLayer.listenToMessages().listen((data) async {
      final newMessage = ModelMessage.fromJson(data);

      final isForCurrentUser = userType == EnumUserType.customer
          ? newMessage.userAuthId == currentUserAuthId
          : newMessage.providerAuthId == currentUserAuthId;

      if (!isForCurrentUser) return;

      conversionMessages = await chatLayer.getUserConversions(
        userType: userType,
        authId: currentUserAuthId,
      );

      add(UpdateConversationList());
    });
  }
}
