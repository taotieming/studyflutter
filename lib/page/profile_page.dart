import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter/components/toolbar.dart';
import 'package:study_flutter/components/user_avart.dart';
import 'package:study_flutter/config/app_routes.dart';
import 'package:study_flutter/provider/app_repo.dart';
import 'package:study_flutter/styles/app_text.dart';

enum ProfileMenu { edit, logout }

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AppRepo>().user;
    return Scaffold(
      appBar: ToolBar(
        title: "个人中心",
        actions: [
          PopupMenuButton<ProfileMenu>(
            onSelected: (value) {
              switch (value) {
                case ProfileMenu.edit:
                  Navigator.of(context).pushNamed(AppRoute.editProfile);
                  break;
                case ProfileMenu.logout:
                  print('Log out');
                  break;
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text('编辑'),
                  value: ProfileMenu.edit,
                ),
                PopupMenuItem(child: Text('编辑'), value: ProfileMenu.logout),
              ];
            },
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          UserAvatar(
            size: 90,
          ),
          SizedBox(
            height: 24,
          ),
          Text(
            '${user?.RealName}',
            style: AppText.header2,
          ),
          Text(
            '${user?.School}',
            style: AppText.subtitle3,
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '4565',
                    style: AppText.subtitle3,
                  ),
                  Text(
                    '粉丝',
                    style: AppText.subtitle3,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '322',
                    style: AppText.subtitle3,
                  ),
                  Text(
                    '发布',
                    style: AppText.subtitle3,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '2',
                    style: AppText.subtitle3,
                  ),
                  Text(
                    '关注',
                    style: AppText.subtitle3,
                  ),
                ],
              )
            ],
          ),
          Divider(
            thickness: 1,
            height: 24,
          )
        ],
      ),
    );
  }
}
