import 'dart:convert';

import 'package:study_flutter/config/app_api.dart';
import 'package:http/http.dart' as http;
import 'package:study_flutter/provider/app_repo.dart';

abstract class ServiceBase<T> {
  Future<T> call();

// 用来格式化，传入的字符串，变成uri 形式的
  Uri _getUrl(String url) => Uri.parse(url);

// get请求
  Future<Map<String, dynamic>> get(String apiurl) async {
    try {
      // response = await http.get(apiurl);
      return _handleResponse(await http.get(_getUrl(apiurl)));
    } catch (e) {
      throw Exception(e);
      // return _handleResponse(await http.get(_getUrl(apiurl)));
    }
  }

// post请求，
  Future<Map<String, dynamic>> post(String apiurl, String usertoken) async {
    try {
      final headers = {'Authorization': usertoken};
      final body = {"status": 0, "page": 1, "pageSize": 15};
      // final result = ;
      return _handleResponse(await http.post(Uri.parse(apiurl),
          body: jsonEncode(body), headers: headers));
    } catch (e) {
      throw Exception(e);
      // return _handleResponse(await http.get(_getUrl(apiurl)));
    }
  }

//  用来处理，网络请求的返回信息。
  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception();
    }
  }
}
