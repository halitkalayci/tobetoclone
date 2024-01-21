import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String username;
  String email;
  String? biography;
  UserModel({
    required this.username,
    required this.email,
    this.biography,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'username': username});
    result.addAll({'email': email});
    if (biography != null) {
      result.addAll({'biography': biography});
    }

    return result;
  }

  factory UserModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final map = snapshot.data() as Map;
    return UserModel(
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      biography: map['biography'],
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      biography: map['biography'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
