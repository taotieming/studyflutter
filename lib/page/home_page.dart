import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter/components/post_item.dart';
import 'package:study_flutter/components/toolbar.dart';
import 'package:study_flutter/config/app_string.dart';
import 'package:study_flutter/provider/app_repo.dart';
import 'package:study_flutter/provider/post_provider.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    print('又点击了');
    super.initState();
    String token = context.read<AppRepo>().token ?? '';
    context.read<PostProvider>().getmyclass(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ToolBar(
          title: AppStrings.appName,
          actions: [
            IconButton(
                onPressed: () {
                  // 此处弹出新的界面
                  // Navigator.of(context).pushNamed(AppRoute.nearby);
                  // 此处弹出谈话狂
                  _showInputDialog();
                },
                icon: SvgPicture.asset('assets/svg/ic_location.svg'))
          ],
        ),
        body: Consumer<PostProvider>(
          builder: (BuildContext context, PostProvider value, Widget? child) {
            return ListView.separated(
              itemBuilder: (context, index) {
                return PostItem(user: value.list[index]);
              },
              itemCount: value.list.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 24);
              },
            );
          },
        ));
  }

  void _showInputDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter your name'),
          content: TextField(
            onChanged: (value) {
              context.read<PostProvider>().classnum = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {},
            ),
            TextButton(
              child: Text('Submit'),
              onPressed: () {
                // Do something with the input value
                context
                    .read<PostProvider>()
                    .joinClass(context.read<AppRepo>().token!)
                    .then((value) {
                  Navigator.of(context).pop();
                });
              },
            ),
          ],
        );
      },
    );
  }
}
