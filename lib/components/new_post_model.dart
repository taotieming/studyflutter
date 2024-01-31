import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter/components/app_textfield.dart';
import 'package:study_flutter/provider/app_repo.dart';
import 'package:study_flutter/provider/post_provider.dart';
import 'package:study_flutter/styles/app_colors.dart';
import 'package:study_flutter/styles/app_text.dart';

class NewPostModelpage extends StatelessWidget {
  const NewPostModelpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      padding: EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            "insert message",
            style: AppText.header1,
          ),
          SizedBox(
            height: 16,
          ),
          AppTextfield(
            hint: "message",
            onChange: (value) {
              context.read<PostProvider>().message = value;
            },
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            "add image",
            style: AppText.header1,
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Center(
              child: Text('add image'),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text('OR'),
          SizedBox(
            height: 16,
          ),
          OutlinedButton(onPressed: () {}, child: Text('camera')),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () {
                context
                    .read<PostProvider>()
                    .createPost(context.read<AppRepo>().token!)
                    .then((value) {
                  Navigator.of(context).pop();
                });
              },
              child: Text('Post'))
        ],
      ),
    );
  }
}
