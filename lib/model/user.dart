import 'package:flutter/material.dart';

class User {

  String? id;
  String? username;
  String? avatar;
  Future<Map<String, String>>? authHeaders;

  User(String? id, String? username,String? avatar,@required Future<Map<String, String>>? authHeaders) {
    this.id = id;
    this.username = username;
    this.avatar = avatar;
    this.authHeaders = authHeaders;
  }
}

