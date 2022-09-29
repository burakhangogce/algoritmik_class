import 'dart:convert';

class UserInfoModel {
  String? sub;
  String? preferred_username;
  String? name;
  String? given_name;
  String? role;
  String? customerNo;
  String? email;
  UserInfoModel({
    this.sub,
    this.preferred_username,
    this.name,
    this.given_name,
    this.role,
    this.customerNo,
    this.email,
  });

  UserInfoModel copyWith({
    String? sub,
    String? preferred_username,
    String? name,
    String? given_name,
    String? role,
    String? customerNo,
    String? email,
  }) {
    return UserInfoModel(
      sub: sub ?? this.sub,
      preferred_username: preferred_username ?? this.preferred_username,
      name: name ?? this.name,
      given_name: given_name ?? this.given_name,
      role: role ?? this.role,
      customerNo: customerNo ?? this.customerNo,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sub': sub,
      'preferred_username': preferred_username,
      'name': name,
      'given_name': given_name,
      'role': role,
      'customerNo': customerNo,
      'email': email,
    };
  }

  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      sub: map['sub'],
      preferred_username: map['preferred_username'],
      name: map['name'],
      given_name: map['given_name'],
      role: map['role'],
      customerNo: map['customerNo'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfoModel.fromJson(String source) =>
      UserInfoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserInfoModel(sub: $sub, preferred_username: $preferred_username, name: $name, given_name: $given_name, role: $role, customerNo: $customerNo, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserInfoModel &&
        other.sub == sub &&
        other.preferred_username == preferred_username &&
        other.name == name &&
        other.given_name == given_name &&
        other.role == role &&
        other.customerNo == customerNo &&
        other.email == email;
  }

  @override
  int get hashCode {
    return sub.hashCode ^
        preferred_username.hashCode ^
        name.hashCode ^
        given_name.hashCode ^
        role.hashCode ^
        customerNo.hashCode ^
        email.hashCode;
  }
}
