import 'package:final_project/models/chat/model_message.dart' hide User;
import 'package:final_project/screens/general/chats/bloc/chats_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class ProviderChatsScreen extends StatelessWidget {
  const ProviderChatsScreen({super.key, required this.sender});
  final ModelMessage sender;

  @override
  Widget build(BuildContext context) {
    String avatar =
        sender.user?.avatar ??
        "https://www.arabiaweddings.com/sites/default/files/styles/max980/public/listing/2020/01/14/jwan_hall.jpg?itok=svPe8vrk";
    String name = sender.user?.name ?? "User";
    //  String authId=sender.providers!.nameEn!;

    return BlocProvider(
      create: (context) => ChatsBloc(),
      child: Builder(
        builder: (context) {
          var bloc = context.read<ChatsBloc>();
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,

              title: Row(
                children: [
                  BackButton(
                    onPressed: () {
                      bloc.chatController.dispose();
                      bloc.chatController = InMemoryChatController();
                      Navigator.pop(context);
                    },
                  ),
                  CircleAvatar(backgroundImage: NetworkImage(avatar)),
                  SizedBox(width: 16.0 * 0.75),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(name, style: TextStyle(fontSize: 16))],
                  ),
                ],
              ),
            ),
            body: BlocBuilder<ChatsBloc, ChatsState>(
              builder: (context, state) {
                if (state is ChatsInitial) {
                  print("ChatsInitial");
                  // handel this
                  bloc.add(LoadMessage(authId: sender.providerAuthId!));
                }

                return Column(
                  children: [
                    Expanded(
                      child: Chat(
                        chatController: bloc.chatController,
                        // toDo change it to user id
                        currentUserId: bloc.currentUserAuthId,
                        onMessageSend: (text) {
                          print(sender.owner);
                          bloc.add(SendMessage(userInput: text));
                        },
                        resolveUser: (UserID id) async {
                          return User(id: id);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
