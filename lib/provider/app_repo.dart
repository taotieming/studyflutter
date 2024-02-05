import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:study_flutter/data/model/chat.dart';
import 'package:study_flutter/data/model/user.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final chatjsonme = {
  "message":
      "Reloaded 1 of 1187 libraries in 2,133ms (compile: 19 ms, reload: 87 ms, reassemble: 2011 ms)",
  "user": {
    'StudentID': "1004",
    'name': 'wcz',
  }
};

final chatjsonother = {
  "message": "nihao",
  "user": {
    'StudentID': "1223",
    'name': 'ttm',
  }
};

class AppRepo extends ChangeNotifier {
  String? _token;
  User? user;

  //即时通讯
  WebSocketChannel? _channel;
  List<Chat> chats = [];

  set token(String? value) {
    _token = value;
  }

  String? get token => _token;

  // connectSocket() {
  //   final wsUrl = Uri.parse('127.0.0.1');
  //   _channel = WebSocketChannel.connect(wsUrl);
  //   _channel?.stream.listen((message) {
  //     chats.add(Chat.fromJson(jsonDecode(message)));
  //     chats.add(Chat.fromJson(jsonDecode(message)));
  //     notifyListeners();
  //   });
  // }
  connectSocket() {
    // final wsUrl = Uri.parse('127.0.0.1');
    // _channel = WebSocketChannel.connect(wsUrl);
    // _channel?.stream.listen((message) {
    chats.add(Chat.fromJson(chatjsonme));
    chats.add(Chat.fromJson(chatjsonother));
    notifyListeners();
    // });
  }
}
