// ignore: file_names

import 'package:http/http.dart' as http;
import 'dart:convert';
class Album {
  final int? userId;
  final int? id;
  final String? title;

  Album(this.userId, this.id, this.title);

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(json["userId"], json["id"], json['title']);
  }
}

var photoslibrary = "https://www.googleapis.com/auth/photoslibrary";
var albums = "https://photoslibrary.googleapis.com/v1/mediaItems";
var photoslibrarySharing = "https://www.googleapis.com/auth/photoslibrary.sharing";
Future<http.Response> fetchAlbum(Future<Map<String, String>> authHeaders) async {
  final response = await http
      .get(Uri.parse(albums), headers: await authHeaders);
  print('vanlam');
  print(response.body);
  return response;
}