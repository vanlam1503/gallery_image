
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_image/api/photo_library.dart';
import 'package:gallery_image/model/media_item.dart';
import 'package:gallery_image/model/result.dart';
import 'package:gallery_image/model/album.dart';
import 'package:gallery_image/screens/home/home_bloc.dart';

class Home extends StatefulWidget {

  Future<Map<String, String>>? authHeaders;

  Home(Future<Map<String, String>>? authHeaders) {
    this.authHeaders = authHeaders;
  }

  @override
  State<Home> createState() => _Home(authHeaders);
}

class _Home extends State<Home> {

  final int crossAxisCount = 3;
  double get width => MediaQuery.of(context).size.width / crossAxisCount;
  Future<Map<String, String>>? authHeaders;
  var homeBloc = HomeBloc();

  _Home(Future<Map<String, String>>? authHeaders) {
    this.authHeaders = authHeaders;
  }

  @override
  void initState() {
    homeBloc.fetchMediaItems(authHeaders);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Media Items')),
      body: Center(child: gridView)
    );
  }

  Widget get gridView {
    return StreamBuilder(
      stream: homeBloc.controllerStream,
        builder: (context, snapshot) {
        if (snapshot.data is SuccessState<List<MediaItem>>) {
          List<MediaItem> items = (snapshot.data as SuccessState<List<MediaItem>>).value;
          return GridView.count(crossAxisCount: crossAxisCount,
              padding: EdgeInsets.all(5),
              children: List.generate(items.length, (index) {
                return Container(
                    width: width,
                    height: width,
                    child: FittedBox(
                      child: image(items[index].baseUrl),
                      fit: BoxFit.fitWidth,
                    )
                );
              })
          );
        } else {
          return Center(
            child: Text(''),
          );
        }
      });
  }

  Widget image(String? photoUrl) {
    if (photoUrl != null) {
      return FadeInImage.assetNetwork(
        placeholder: 'images/img_placeholder.png',
        image: photoUrl,
      );
    } else {
      return Image.asset('images/img_placeholder.png');
    }
  }
}