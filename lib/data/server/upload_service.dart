import 'package:study_flutter/data/server/base_service.dart';

class UploadService extends ServiceBase<String> {
  final String path;

  UploadService({required this.path});

  @override
  Future<String> call() async {
    final result = await upload("upload", 'photo', path);
    return result['data']['url'];
  }
}
