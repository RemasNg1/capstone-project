import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/models/chat/model_message.dart';
import 'package:final_project/screens/general/chats/bloc/chats_bloc.dart';
import 'package:final_project/screens/general/chats/client/chats_screen.dart';
import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen({super.key, required List messages});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatsBloc(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("chat.chats".tr()),
        ),
        body: SafeArea(
          child: Builder(
            builder: (context) {
              var bloc = context.read<ChatsBloc>();
              return BlocBuilder<ChatsBloc, ChatsState>(
                builder: (context, state) {
                  if (state is ChatsInitial) {
                    bloc.add(ClientLoadConversion());
                  }

                  final List<ModelMessage> messages = bloc.conversionMessages;

                  print(" LoadConversion ");
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: context.getWidth(),
                        height: context.getHeight(factor: 0.73),
                        child: ListView.builder(
                          itemCount: messages.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ChattingScreen(sender: messages[index]),
                                  ),
                                );
                              },
                              child: ListTile(
                                leading: CircleAvatar(
                                  maxRadius: 30,
                                  backgroundImage: NetworkImage(
                                    messages[index].providers?.avatar ??
                                        'https://www.arabiaweddings.com/sites/default/files/styles/max980/public/listing/2020/01/14/jwan_hall.jpg?itok=svPe8vrk',
                                  ),
                                ),
                                title: Text(
                                  messages[index].providers?.nameEn ??
                                      "Provider",
                                ),
                                subtitle: Text(
                                  messages[index].content ??
                                      "No message content",
                                ),
                                trailing: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
