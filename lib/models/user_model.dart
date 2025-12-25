// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String token;
  final String id;
  final String name;
  final String email;
  final String mobile;
  UserModel({
    required this.token,
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      token: map['token'],
      id: map['id'],
      name: map['name'],
      email: map['email'],
      mobile: map['mobile'],
    );
  }
}
