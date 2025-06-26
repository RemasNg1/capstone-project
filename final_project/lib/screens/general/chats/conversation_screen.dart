import 'package:final_project/screens/booking/models/message_temp_model.dart';
import 'package:final_project/screens/general/chats/chats_screen.dart';
import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen({super.key, required this.messages});
  final List<MessageTempModel> messages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: Text("Chat")),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: context.getWidth(),
              height: context.getHeight(factor: 0.73),
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      maxRadius: 30,
                      backgroundImage: NetworkImage(
                        messages[index].user.avatar,
                      ),
                    ),
                    title: Text(messages[index].user.name),
                    subtitle: Text(messages[index].content),
                    trailing: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ChattingScreen(sender: messages[index].user),
                          ),
                        );
                      },
                      child: Icon(Icons.arrow_forward_ios_outlined),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
