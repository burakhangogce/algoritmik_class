import 'dart:convert';

class LoginInputModel {
  String username = "";
  String password = "";
  LoginInputModel({
    required this.username,
    required this.password,
  });

  LoginInputModel copyWith({
    String? username,
    String? password,
  }) {
    return LoginInputModel(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  factory LoginInputModel.fromMap(Map<String, dynamic> map) {
    return LoginInputModel(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginInputModel.fromJson(String source) =>
      LoginInputModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'LoginInputModel(username: $username, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginInputModel &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode => username.hashCode ^ password.hashCode;
}
