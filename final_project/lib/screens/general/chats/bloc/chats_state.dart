part of 'chats_bloc.dart';

@immutable
sealed class ChatsState {}

final class ChatsInitial extends ChatsState {}
class SendMessageSuccessfully extends ChatsState{}
class Error extends ChatsState{}
class LoadingMessages extends ChatsState{}
class LoadingMessagesSuccessfully extends ChatsState{}

class LoadingConversation extends ChatsState{}
class LoadingConversationSuccessfully extends ChatsState{}

class LoadOldMessage extends ChatsState{}