import '../model/user.dart';

class LoginResponse {
  final String token;

  LoginResponse(this.token);
  factory LoginResponse.frormJson(Map<String, dynamic> json) =>
      LoginResponse(json['token']);
}

class infoResponse {
  final User user;

  infoResponse(this.user);
  factory infoResponse.frormJson(Map<String, dynamic> json) =>
      infoResponse(User.fromJson(json));
}
