part of 'chats_bloc.dart';

@immutable
sealed class ChatsEvent {}

class SendMessage extends ChatsEvent {
  final String userInput;
  final UserTempModel user;
  final ProviderTempModel provider;

  SendMessage({required this.userInput, required this.user, required this.provider});
}

class LoadMessage extends ChatsEvent {
  final int senderId;

  LoadMessage({required this.senderId});
}
