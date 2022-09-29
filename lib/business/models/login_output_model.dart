import 'dart:convert';

import 'login_result.dart';

class LoginOutputModel {
  String token;
  LoginOutputModel({
    required this.token,
  });

  LoginOutputModel copyWith({
    String? token,
    bool? success,
    LoginResult? result,
  }) {
    return LoginOutputModel(
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  factory LoginOutputModel.fromMap(Map<String, dynamic> map) {
    return LoginOutputModel(
      token: map['Token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginOutputModel.fromJson(String source) =>
      LoginOutputModel.fromMap(json.decode(source));

  @override
  String toString() => 'LoginOutputModel(token: $token)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginOutputModel && other.token == token;
  }

  @override
  int get hashCode => token.hashCode;
}
