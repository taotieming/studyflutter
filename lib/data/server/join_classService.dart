import 'package:study_flutter/config/app_api.dart';
import 'package:study_flutter/data/server/base_service.dart';

class JoinClassService extends ServiceBase {
  final String classnum;
  final String token;

  JoinClassService({required this.classnum, required this.token});
  @override
  Future call() async {
    final body = {
      'inviteCode': classnum,
    };

    final result = await post(body, AppApi.joinClassroom, token);
    
    
  }
}
