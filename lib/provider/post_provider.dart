import 'package:flutter/material.dart';
import 'package:study_flutter/data/model/myclass.dart';
import 'package:study_flutter/data/model/post.dart';
import 'package:study_flutter/data/server/get_post_service.dart';

class PostProvider extends ChangeNotifier {
  final List<Myclass> list = [];
  getpost() async {
    list.clear();
    list.addAll(await GetPostService().call());
    notifyListeners();
  }

  getmyclass(String token) async {
    list.clear();
    list.addAll(await GetPostService().callmyclass(token));
    notifyListeners();
  }
}
