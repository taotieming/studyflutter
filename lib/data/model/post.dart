import 'package:study_flutter/data/model/user.dart';

class Post {
  final int? id;
  final String? messsage;
  final User? owner;
  final DateTime? date;
  final String? image;

  Post(
      {required this.id,
      required this.messsage,
      required this.owner,
      required this.date,
      required this.image});

  factory Post.jsonfrom(Map<String, dynamic> json) => Post(
      id: json['id'],
      messsage: json['message'],
      owner: json['owner'] == null ? null : User.fromJson(json['owner']),
      date: json['date'] == null ? null : DateTime.parse(json['date']),
      image: json['image']);
}
