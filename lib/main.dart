import 'package:flutter/material.dart';
import 'package:gallery_image/Album.dart';
import 'package:gallery_image/screens/home/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gallery_image/screens/login/login.dart';
void main() {
  runApp(const MaterialApp(
    title: "Google Library",
    home: Login(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Gallery Image'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final googleSignIn = GoogleSignIn(
    scopes: ['email', 'https://www.googleapis.com/auth/spreadsheets.readonly'],
      clientId: '830247991511-u58o8inh9kj46e15kje40c457et0qhil.apps.googleusercontent.com'
  );

  void _incrementCounter()  {
    googleSignIn.signIn();
    googleSignIn.onCurrentUserChanged.listen((event) {
      print(event?.authHeaders);
      fetchAlbum(event!.authHeaders);
    });
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
