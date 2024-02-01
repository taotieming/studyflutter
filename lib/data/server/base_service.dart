import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' as parser;

abstract class ServiceBase<T> {
  Future<T> call();

// 用来格式化，传入的字符串，变成uri 形式的
  Uri _getUrl(String url) => Uri.parse(url);

// get请求
  Future<Map<String, dynamic>> get(String apiurl, String? usertoken) async {
    try {
      // response = await http.get(apiurl);
      return _handleResponse(
          await Myrequest(token: usertoken).get(_getUrl(apiurl)));
    } catch (e) {
      throw Exception(e);
      // return _handleResponse(await http.get(_getUrl(apiurl)));
    }
  }

// post请求，
  Future<Map<String, dynamic>> post(
      Map<String, dynamic> body, String apiurl, String? usertoken) async {
    try {
      return _handleResponse(await Myrequest(token: usertoken)
          .post(Uri.parse(apiurl), body: jsonEncode(body)));
    } catch (e) {
      throw Exception(e);
    }
  }

// 上传图片
  Future<Map<String, dynamic>> upload(
      String apiUrl, String fieldName, String path,
      {String? token}) async {
    final client = http.MultipartRequest('post', _getUrl(apiUrl));
    if (token != null) {
      client.headers.addAll({'Authorization': token});
    }
    client.files.add(await http.MultipartFile.fromPath(fieldName, path,
        contentType: parser.MediaType('image', 'jpeg')));
    return _handleResponse(await http.Response.fromStream(await client.send()));
  }

//  用来处理，网络请求的返回信息。
  Map<String, dynamic> _handleResponse(http.Response response) {
    print(response.body);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    if (response.statusCode == 500) {
      return jsonDecode(response.body);
    } else {
      throw Exception();
    }
  }
}

class Myrequest extends http.BaseClient {
  final String? token;

  Myrequest({required this.token});
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (token != null) {
      request.headers['Authorization'] = token!;
    }
    return request.send();
  }
}
