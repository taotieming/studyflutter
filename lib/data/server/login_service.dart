import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:study_flutter/data/response/login_response.dart';

import '../../config/app_api.dart';

class loginService {
  final String username;
  final String password;

  loginService(this.username, this.password);

  Future<LoginResponse> call() async {
    final body = {
      "account": username,
      "password": password,
    };
    final result =
        await http.post(Uri.parse(AppApi.userloginApi), body: jsonEncode(body));

    return LoginResponse.frormJson(jsonDecode(result.body)['data']);
  }
}

class getuserinfoserver {
  final String username;
  final String usertoken;

  getuserinfoserver(this.username, this.usertoken);
  Future<infoResponse> call() async {
    final headers = {'Authorization': usertoken};
    final body = {
      "account": username,

    };
    final result = await http.post(Uri.parse(AppApi.userinfoApi),
        body: jsonEncode(body), headers: headers);
    return infoResponse.frormJson(jsonDecode(result.body)['data']);
  }
}
