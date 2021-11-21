import 'package:flutter/material.dart';
import 'package:gallery_image/api/api_login.dart';
import 'package:gallery_image/model/user.dart';
import 'package:gallery_image/model/unwrap.dart';
import 'package:gallery_image/screens/home/home.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum LoginType {
  login, albums
}

extension LoginTypeTitle on LoginType {
  String get title {
    switch (this) {
      case LoginType.login: return "Login";
      case LoginType.albums: return "Albums";
    }
  }
}

class Login extends StatefulWidget {

  const Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {

  final String placeHolder = 'images/ic_avatar.png';

  APILogin apiLogin = APILogin();
  LoginType login = LoginType.login;
  User? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(login.title)),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Container(
              width: 100,
              height: 100,
              child: Center(child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: _avatarImage(user?.avatar),
              )))),
          Padding(padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
            child: Center(
              child: Text(Unwrap(user?.username).or('username'), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
            )
          ),
          Container(
            width: 140,
            height: 46,
            decoration: const BoxDecoration(
                color: const Color.fromRGBO(104, 86, 105, 1),
                borderRadius: const BorderRadius.all(Radius.circular(23))
              ),
              child: TextButton(child: Text(login.title,
                  style: const TextStyle(color: Colors.white, fontSize: 18
              )), onPressed: onTap),
          )
        ],
      ),
    );
  }

  void onTap() {
    if (login == LoginType.login) {
      signIn();
    } else {
      onPush();
    }
  }

  void signIn() {
    apiLogin.signIn((user) {
      setState(() {
        if (user != null) {
          login = LoginType.albums;
        } else {
          login = LoginType.login;
        }
        this.user = user;
      });
    });
  }

  void onPush() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user?.authHeaders)));
  }

  Widget _avatarImage(String? photoUrl) {
    if (photoUrl != null) {
      return FadeInImage.assetNetwork(
        placeholder: placeHolder,
        image: photoUrl,
      );
    } else {
      return Image.asset(placeHolder);
    }
  }
}