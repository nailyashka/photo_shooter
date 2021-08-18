import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';

enum AppLoginState { notDetermined, loggedOut, loggedIn }

class AppState extends ChangeNotifier {
  AppState() {
    init();
    initDynamicLinks();
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

  void initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLink) async {
      print('onSuccess');
      final Uri? deepLink = dynamicLink?.link;

      if (deepLink != null) {
        print('((((((((((((((((((((((((((((((((((((((((((((((');
        //Navigator.pushNamed(context, 'HomePage');
      }
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    print('PendingDynamicLinkData $data');
    if (deepLink != null) {
      final valid =
          FirebaseAuth.instance.isSignInWithEmailLink(deepLink.toString());
      if (valid) {
        FirebaseAuth.instance.signInWithEmailLink(
            email: 'gilazieva@gmail.com', emailLink: deepLink.toString());
      }
    }
  }
}
