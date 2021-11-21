import 'dart:io';
import 'package:gallery_image/api/api_client.dart';
import 'package:gallery_image/model/album.dart';
import 'package:gallery_image/model/media_item.dart';
import 'package:gallery_image/model/result.dart';

class PhotoLibrary {

  static String albums = 'https://photoslibrary.googleapis.com/v1/albums';
  static String mediaItems = 'https://photoslibrary.googleapis.com/v1/mediaItems';
  static String sharedAlbums = 'https://photoslibrary.googleapis.com/v1/sharedAlbums';

  static String get apiKey {
    if (Platform.isIOS) {
      return 'AIzaSyAPczqIgrm73M-n6O6zd7xqVDgwHSu5GMk';
    } else if (Platform.isAndroid) {
      return 'AIzaSyAPczqIgrm73M-n6O6zd7xqVDgwHSu5GMk';
    } else {
      return 'AIzaSyAhFdHuYqUW0VyEcu01S6B8sFuaWNW--mA'; // Web client
    }
  }

  ApiClient apiClient = ApiClient();

  Future<Result<List<Album>>> fetchAlbums(Future<Map<String, String>>? authHeaders) async {
    final result = await apiClient.fetch('$albums?pageSize=50&excludeNonAppCreatedData=false', authHeaders);
    if (result is SuccessState) {
      List values = result.value['albums'];
      List<Album> albums = values.map((e) => Album.fromJson(e)).toList();
      return Result.success(albums);
    } else {
      return Result.failure(1, 'Can not fetch album');
    }
  }

  Future<Result<List<MediaItem>>> fetchMediaItems(Future<Map<String, String>>? authHeaders) async {
    final result = await apiClient.fetch('$mediaItems?pageSize=50', authHeaders);
    if (result is SuccessState) {
      List values = result.value['mediaItems'];
      List<MediaItem> mediaItems = values.map((e) => MediaItem.fromJson(e)).toList();
      return Result.success(mediaItems);
    } else {
      return Result.failure(1, 'Can not fetch album');
    }
  }

  Future<Result<List<Album>>> fetchSharedAlbums(Future<Map<String, String>>? authHeaders) async {
    final result = await apiClient.fetch('$sharedAlbums?pageSize=50', authHeaders);
    if (result is SuccessState) {
      List values = result.value['sharedAlbums'];
      List<Album> albums = values.map((e) => Album.fromJson(e)).toList();
      return Result.success(albums);
    } else {
      return Result.failure(1, 'Can not fetch sharedAlbum');
    }
  }

  static String fullPhotoPath(String photoURL) {
    return '$photoURL?key=$apiKey';
  }
}