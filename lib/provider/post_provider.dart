import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:study_flutter/data/model/myclass.dart';
import 'package:study_flutter/data/server/create_post_service.dart';
import 'package:study_flutter/data/server/get_post_service.dart';
import 'package:study_flutter/data/server/join_classService.dart';
import 'package:study_flutter/data/server/upload_service.dart';
import 'package:study_flutter/utils/utils.dart';

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

// 加入班级的接口
  Future<void> joinClass(String token) async {
    await JoinClassService(classnum: classnum, token: token).call();
    classnum = '';
    getmyclass(token);
  }

// 发送朋友圈
  Future<void> createPost(String token) async {
    String? image;
    if (imagepath != null) {
      image = await upload();
    }
    await CreatePostService(message: message, token: token, image: image)
        .call();
    message = '';
    imagepath = null;
    getpost(token);
  }

// 上传班级接口

  Future<String> upload() async {
    return await UploadService(path: imagepath!).call();
  }

// 选择图片
  pickImage(ImageSource source) async {
    try {
      final path = await Utils.pickImage(source);
      final croppedImage = await Utils.croppedImage(path);
      // imagepath = path;
      imagepath = croppedImage?.path ?? '';
      notifyListeners();
      print(imagepath);
    } catch (e) {
      // return '';
      print(e);
    }
  }

// 删除图片
  deleteImage() {
    imagepath = null;
    notifyListeners();
  }
}
