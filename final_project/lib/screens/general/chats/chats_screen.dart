import 'package:final_project/screens/booking/models/provider_temp_model.dart';
import 'package:final_project/screens/booking/models/user_temp_model.dart';
import 'package:final_project/screens/general/chats/bloc/chats_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class ChattingScreen extends StatelessWidget {
  const ChattingScreen({super.key, required this.sender});
  final UserTempModel sender;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatsBloc(),
      child: Builder(
        builder: (context) {
          var bloc = context.read< ChatsBloc>();

          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              flexibleSpace: 
              Padding(
                padding: const EdgeInsets.only(
                  top: 55,
                  // left: 100,
                  // right: 100,
                ), 

                child:
                 Row(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: NetworkImage(sender.avatar),
                    ),
                    Text(sender.name),
                  ],
                ),
              ),
            ),
            body: BlocBuilder< ChatsBloc,  ChatsState>(
              builder: (context, state) {
                if (state is  ChatsInitial) {
                  bloc.add(LoadMessage(senderId: sender.id));
                }

                return Column(
                  children: [
                    Expanded(
                      child: Chat(
                        chatController: bloc.chatController,
                        // toDo change it to user id
                        currentUserId: "provider${providers[0].id}",
                        onMessageSend: (text) {
                          bloc.add(SendMessage(userInput: text, user: sender, provider: providers[0]));
                        },
                        resolveUser: (UserID id) async {
                          return User(id: "user${providers[0].id}", name: 'John Doe');
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
