import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter/components/chat_me_item.dart';
import 'package:study_flutter/components/chat_other_item.dart';
import 'package:study_flutter/components/toolbar.dart';
import 'package:study_flutter/provider/app_repo.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppRepo>();
    return Scaffold(
      appBar: ToolBar(
        title: 'Chat',
        actions: [
          TextButton(
              onPressed: () {
                print('发送消息');
                provider.connectSocket();
              },
              child: Text("发送消息"))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final chat = provider.chats[index];
          if (chat.user.StudentID == provider.user?.StudentID) {
            return ChatMeItem(chat: provider.chats[index]);
          } else {
            return ChatOtherItem(chat: provider.chats[index]);
          }
        },
        itemCount: provider.chats.length,
      ),
    );
  }
}
