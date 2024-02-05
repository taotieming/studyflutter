import 'package:study_flutter/data/model/user.dart';

class Chat {
  final String message;
  final User user;

  Chat({required this.message, required this.user});

  factory Chat.fromJson(Map<String, dynamic> json) =>
      Chat(message: json['message'], user: User.fromJson(json['user']));
}
