import 'dart:convert';

import 'package:study_flutter/config/app_api.dart';
import 'package:study_flutter/data/model/myclass.dart';
import 'package:study_flutter/data/server/base_service.dart';
import 'package:study_flutter/provider/app_repo.dart';

class GetPostService extends ServiceBase<List<Myclass>> {
  @override
  Future<List<Myclass>> call() async {
    // TODO: implement call
    final result = await get(AppApi.userClassroom, null);
    return List.generate(result['data'].length,
        (index) => Myclass.jsonfrom(result['data']['list'][index]));
  }

  Future<List<Myclass>> callmyclass(String token) async {
    final body = {"status": 0, "page": 1, "pageSize": 20};
    final result = await post(body, AppApi.userClassroom, token);
    return List.generate(result['data']['list'].length,
        (index) => Myclass.jsonfrom(result['data']['list'][index]));
  }
}
