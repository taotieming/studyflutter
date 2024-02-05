import 'package:flutter/material.dart';
import 'package:study_flutter/components/user_avart.dart';
import 'package:study_flutter/data/model/chat.dart';
import 'package:study_flutter/styles/app_colors.dart';

class ChatMeItem extends StatelessWidget {
  final Chat chat;
  const ChatMeItem({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 30, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: Text(
                chat.message,
                style: TextStyle(color: AppColors.black),
              ),
            ),
          )),
          SizedBox(
            width: 8,
          ),
          UserAvatar()
        ],
      ),
    );
  }
}
