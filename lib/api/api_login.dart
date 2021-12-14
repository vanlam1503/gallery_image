import 'package:google_sign_in/google_sign_in.dart';
import 'package:gallery_image/model/user.dart';
import 'dart:io';
class APILogin {

  static String get clientID {
    if (Platform.isIOS) {
     return '830247991511-u58o8inh9kj46e15kje40c457et0qhil.apps.googleusercontent.com';
    } else if (Platform.isAndroid) {
      return '830247991511-ftmo2t6galjj5a3e8f132g1v8gkcr6nb.apps.googleusercontent.com';
    } else {
      return '830247991511-ebq17ug8f3dveksha1ke5o8975moir8a.apps.googleusercontent.com'; // Web client
    }
  }

  GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
        'https://www.googleapis.com/auth/photoslibrary',
        'https://www.googleapis.com/auth/photoslibrary.appendonly',
        'https://www.googleapis.com/auth/photoslibrary.sharing'
      ],
      clientId: clientID
  );

  void signIn(Function(User) completion) {
    googleSignIn.signIn();
    googleSignIn.onCurrentUserChanged.listen((event) {
      if (event != null) {
        var user = User(event.id, event.displayName, event.photoUrl, event.authHeaders);
        completion(user);
      }
    });
  }
}