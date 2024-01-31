import 'package:flutter/material.dart';
import 'package:study_flutter/data/model/user.dart';

// import '../model/user.dart';

class AppRepo extends ChangeNotifier {
  String? _token;
  User? user;
  set token(String? value) {
    _token = value;
  }

  String? get token => _token;
}
