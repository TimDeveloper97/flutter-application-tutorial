import 'package:chat_app/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final DateFormat formatter = DateFormat('hh:mm a');

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('createdAt', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Text('No messages found.'),
          );
        }

        if (snapshot.hasError) {
          return const Center(
            child: Text('Something went wrong...'),
          );
        }

        final loadedMessages = snapshot.data!.docs;
        // type message: 1 - 2 - 3
        var types = List.generate(loadedMessages.length, (index) => 2);

        for (var i = 0; i < loadedMessages.length; i++) {
          final previousMessage =
              i - 1 >= 0 ? loadedMessages[i - 1].data() : null;
          final message = loadedMessages[i].data();
          final nextMessage = i + 1 < loadedMessages.length
              ? loadedMessages[i + 1].data()
              : null;

          // get message
          final previous =
              previousMessage != null ? previousMessage['userId'] : null;
          final current = message['userId'];
          final next = nextMessage != null ? nextMessage['userId'] : null;

          // handle index
          if (previous == null) {
            if (next != null && current == next) {
              types[i] = 1;
            } else {
              types[i] = 2;
            }
          } else if (next == null) {
            types[i - 1] = 2;
            types[i] = 3;
          } else {
            if (next != current) {
              types[i + 1] = 1;
              types[i] = 3;
            }

            if (previous != current && current != next) types[i] = 2;
          }
        }

        return ListView.builder(
          padding: const EdgeInsets.only(bottom: 40, left: 13, right: 13),
          reverse: true,
          itemCount: loadedMessages.length,
          itemBuilder: (context, index) {
            final message = loadedMessages[index].data();
            final nextMessage = index + 1 < loadedMessages.length
                ? loadedMessages[index + 1].data()
                : null;

            final currentMessageUserId = message['userId'];
            final nextMessageUserId =
                nextMessage != null ? nextMessage['userId'] : null;
            final nextUserIsSame = nextMessageUserId == currentMessageUserId;
            final time = DateTime.fromMillisecondsSinceEpoch(
                (message['createdAt'] as Timestamp).seconds);
            final formatTime = formatter.format(time);

            if (nextUserIsSame) {
              return MessageBubble.next(
                  message: message['text'],
                  type: types[index],
                  time: formatTime,
                  isMe: authenticatedUser.uid == currentMessageUserId);
            } else {
              return MessageBubble.first(
                  userImage: message['userImage'],
                  username: message['username'],
                  message: message['text'],
                  time: formatTime,
                  type: types[index],
                  isMe: authenticatedUser.uid == currentMessageUserId);
            }
          },
        );
      },
    );
  }
}
