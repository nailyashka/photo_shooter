import 'package:flutter/material.dart';
import 'package:photo_shooter/app_state.dart';
import 'package:photo_shooter/email_auth.dart';
import 'package:photo_shooter/home_page.dart';
import 'package:photo_shooter/notice.dart';
import 'package:photo_shooter/target_server.dart';
import 'package:photo_shooter/welcome.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppState(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '???',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        routes: {
          'WelcomePage': (contex) => const WelcomePage(),
          'EmailAuthenticationPage': (contex) =>
              const EmailAuthenticationPage(),
          'EmailSentPage': (contex) => const EmailSentPage(),
          'HomePage': (context) => const HomePage(),
          'EnterPage': (context) => const EnterPage(),
          'LogInPage': (context) => const EnterPage(),
        },
        home: Consumer<AppState>(
          builder: (_, app, child) => buildHomePage(app.loginState),
        ));
  }

  Widget buildHomePage(AppLoginState loginState) {
    print('BUILD CALLED for loginState $loginState');
    switch (loginState) {
      case AppLoginState.notDetermined:
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      case AppLoginState.loggedOut:
        return WelcomePage();
      case AppLoginState.loggedIn:
        return HomePage();
    }
  }
}
