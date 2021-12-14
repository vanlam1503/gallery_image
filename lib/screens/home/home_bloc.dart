import 'dart:async';

import 'package:gallery_image/abstract/bloc.dart';
import 'package:gallery_image/api/photo_library.dart';
import 'package:gallery_image/model/album.dart';
import 'package:gallery_image/model/media_item.dart';
import 'package:gallery_image/model/result.dart';

class HomeBloc implements Bloc {

  final controller = StreamController<Result<List<MediaItem>>>();

  Stream<Result<List<MediaItem>>> get controllerStream => controller.stream;

  void fetchMediaItems(Future<Map<String, String>>? authHeaders) async {
    var result = await PhotoLibrary().fetchMediaItems(authHeaders);
    controller.sink.add(result);
  }

  @override
  void dispose() {
    controller.close();
  }
}