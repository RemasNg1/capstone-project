// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chats_bloc.dart';

@immutable
sealed class ChatsEvent {}

class SendMessage extends ChatsEvent {
  final String userInput;

  SendMessage({required this.userInput});
}

class LoadMessage extends ChatsEvent {
  final String authId;

  LoadMessage({required this.authId});
}

class ClientLoadConversion extends ChatsEvent {}

class ProviderLoadConversion extends ChatsEvent {}
