import 'package:flutter/material.dart';
import 'package:study_flutter/components/user_avart.dart';
import 'package:study_flutter/data/model/chat.dart';
import 'package:study_flutter/styles/app_colors.dart';

class ChatOtherItem extends StatelessWidget {
  final Chat chat;
  const ChatOtherItem({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 30, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAvatar(),
          Expanded(
              child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
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
        ],
      ),
    );
  }
}
