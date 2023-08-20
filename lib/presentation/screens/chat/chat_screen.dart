import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/message.dart';
import 'package:flutter_application_1/presentation/providers/chat_providers.dart';
import 'package:flutter_application_1/presentation/widgets/chat/my_message_bubble.dart';

import 'package:flutter_application_1/presentation/widgets/chat/her_message_bubble.dart';
import 'package:flutter_application_1/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.8),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/19484515?v=4'),
          ),
        ),
        title: const Text('Chat de Mick'),
      ),
      body: const _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  controller: chatProvider.chatScrollController,
                  itemCount: chatProvider.messageList.length, // Add this line
                  itemBuilder: (context, index) {
                    final message = chatProvider.messageList[index];
                    return message.fromWho == FromWho.her
                        ? HerMessageBubble(message: message)
                        : MyMessageBubble(message: message);
                  }),
            ), // Add this line
            MessageFieldBox(onValue: (value) {
              chatProvider.sendMessage(value);
            }),
          ],
        ),
      ),
    );
  }
}
