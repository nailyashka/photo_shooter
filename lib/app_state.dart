import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

enum AppLoginState { notDetermined, loggedOut, loggedIn }

class AppState extends ChangeNotifier {
  AppState() {
    init();
  }

  AppLoginState _loginState = AppLoginState.notDetermined;

  AppLoginState get loginState => _loginState;

  Future<void> init() async {
    await Firebase.initializeApp();
    FirebaseAuth.instance.userChanges().listen((user) {
      print('* userChanged emit $user');
      if (user == null) {
        _loginState = AppLoginState.loggedOut;
      } else {
        _loginState = AppLoginState.loggedIn;
      }
      notifyListeners();
    });
  }
}
