import 'package:flutter/material.dart';
import 'package:study_flutter/data/response/login_response.dart';
import 'package:study_flutter/data/server/login_service.dart';

class LoginProvider extends ChangeNotifier {
  var username = '';
  var password = '';
  var usertoken = '';
  
  Future<LoginResponse> login() async {
    return loginService(username, password).call();
  }

  Future<infoResponse> getuserinfo() async {
    return getuserinfoserver(username, usertoken).call();
  }
}
