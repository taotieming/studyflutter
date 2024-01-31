import 'package:flutter/material.dart';
import 'package:study_flutter/config/app_api.dart';
import 'package:study_flutter/config/app_icons.dart';
import 'package:study_flutter/data/model/myclass.dart';
import 'package:study_flutter/styles/app_text.dart';

class PostItem extends StatelessWidget {
  final Myclass user;
  const PostItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            children: [
              sas(user.coverUrl),
              SizedBox(
                width: 16,
              ),
              Text(
                '${user.classroomName}',
                style: AppText.subtitle3,
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          content(user.coverUrl),
          Text(
            '${user.classroomName}',
            style: AppText.subtitle3,
          )
        ],
      ),
    );
  }

  Widget sas(String? url) {
    if (url == null) {
      return Image.asset(
        AppIcons.icimage_morenkt,
        width: 40,
        height: 40,
      );
    }
    return Image.network(
      '${AppApi.imagebaseUrl}${user.coverUrl}',
      width: 40,
      height: 40,
    );
  }

  Widget content(String? url) {
    if (url == null) {
      return Image.asset(
        AppIcons.icimage_morenkt,
        fit: BoxFit.contain,
        width: 440,
        height: 240,
      );
    }
    return Image.network(
      '${AppApi.imagebaseUrl}${user.coverUrl}',
      fit: BoxFit.cover,
      width: 440,
      height: 240,
    );
  }
}
