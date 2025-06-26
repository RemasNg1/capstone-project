import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:final_project/screens/booking/enum/types.dart';
import 'package:final_project/screens/booking/models/message_temp_model.dart';
import 'package:final_project/screens/booking/models/provider_temp_model.dart';
import 'package:final_project/screens/booking/models/user_temp_model.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:meta/meta.dart';

part 'chats_event.dart';
part 'chats_state.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
   List<TextMessage> conversionMessages = [];
  final user = providers[0];
  final chatController = InMemoryChatController();
  ChatsBloc() : super(ChatsInitial()) {
    
    on<ChatsEvent>((event, emit) { });
    on<SendMessage>(sendMessage);
    on<LoadMessage>(loadMessage);
  }
  
  FutureOr<void> sendMessage(
    SendMessage event,
    Emitter<ChatsState> emit,
  ) async {
    UserTempModel user = event.user;
    ProviderTempModel provider = event.provider;
    String content = event.userInput;
    // make new massage  and add it in messages list
    var myMessage = makeTextMessage(
      authorType: EnumUserType.provider,
      content: content,
      authorId: user.id,
    );

    chatController.insertMessage(myMessage);
    conversionMessages.add(myMessage);

    MessageTempModel myMessageAsDbModel = MessageTempModel(
      id: Random().nextInt(1000) + 1,
      provider: provider,
      user: user,
      content: content,
      date: DateTime.now(),
      status: EnumChatStatus.send,
      authorType: EnumUserType.provider,
    );
    // add message to local db
    messages.add(myMessageAsDbModel);
    // toDo DB : send message to DB
    emit(Loading());

    emit(SendMessageSuccessfully());
  }

  loadMessage(LoadMessage event, Emitter<ChatsState> emit) {
    int senderId = event.senderId;
    print("from loadMessage");
    List<MessageTempModel>? allMessageWithSenderId = messages
        // this is to get all message from sender
        .where((message) => message.user.id == senderId)
        .toList();

    if (allMessageWithSenderId.isNotEmpty) {
      allMessageWithSenderId.map((message) {
        EnumUserType authorType= EnumUserType.user;
        int authorId=message.user.id;
        if (message.authorType == EnumUserType.provider) {
          authorType=EnumUserType.provider;
          authorId=message.provider.id;
          
        }
        // insert all old  message  to chat
        //toDo whoIAm: EnumUserType.provider should change
        TextMessage textMessage = makeTextMessage(
          authorType: authorType,
          content: message.content,
          authorId: authorId,
        );
        chatController.insertMessage(textMessage);
      }).toList();
      emit(LoadOldMessage());
    }

    //  if(allMessageWithSenderId.isNotEmpty){
    //   conversionMessages=allMessageWithSenderId;
    //  }
  }
}

TextMessage makeTextMessage({
  required EnumUserType authorType,
  required String content,
  required int authorId,
}) {
  TextMessage textMessage = TextMessage(
    createdAt: DateTime.now(),
    id: '${Random().nextInt(1000) + 1}',
    authorId: "${authorType.name}.$authorId",
    text: content,
  );
  if (authorType == EnumUserType.provider) {
    print("provider ----------++++++0+ "+"${authorType.name}.$authorId");
    print(content);
  }
  return textMessage;
}
