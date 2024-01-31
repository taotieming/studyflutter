import 'package:study_flutter/config/app_api.dart';
import 'package:study_flutter/data/server/base_service.dart';

class CreatePostService extends ServiceBase<void> {
  final String message;
  final String token;
  final String? image;

  CreatePostService(
      {required this.message, required this.token, required this.image});

  @override
  Future<void> call() async {
    final body = {
      'message': message,
    };
    if (image != null) {
      body['image'] = image!;
    }
    final result = await post(body, AppApi.joinClassroom, token);
  }
}
