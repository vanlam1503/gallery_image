
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_image/screens/login/login.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {

  final int crossAxisCount = 3;
  
  @override
  void initState() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(child: listView())
    );
  }

  Widget listView() {
    return GridView.count(crossAxisCount: crossAxisCount,
        padding: EdgeInsets.all(5),
        children: List.generate(100, (index) {
          return Container(
            width: MediaQuery.of(context).size.width / crossAxisCount,
            height: MediaQuery.of(context).size.width / crossAxisCount,
            color: Colors.red,
            child: Image.asset('images/ic_avatar.png')
          );
        })
    );
  }
}