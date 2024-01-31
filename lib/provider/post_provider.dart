import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:study_flutter/data/model/myclass.dart';
import 'package:study_flutter/data/model/post.dart';
import 'package:study_flutter/data/server/create_post_service.dart';
import 'package:study_flutter/data/server/get_post_service.dart';
import 'package:study_flutter/data/server/join_classService.dart';

class PostProvider extends ChangeNotifier {
  final List<Myclass> list = [];
  String message = '';
  String classnum = '';
  String? imagepath;

  getpost(String token) async {
    list.clear();
    list.addAll(await GetPostService().call());
    notifyListeners();
  }

  getmyclass(String token) async {
    list.clear();
    list.addAll(await GetPostService().callmyclass(token));
    notifyListeners();
  }

  Future<void> joinClass(String token) async {
    await JoinClassService(classnum: classnum, token: token).call();
    classnum = '';
    getmyclass(token);
  }

  Future<void> createPost(String token) async {
    String? image;
    await CreatePostService(message: message, token: token, image: image)
        .call();
    message = '';
    imagepath = null;
    getmyclass(token);
  }
}
