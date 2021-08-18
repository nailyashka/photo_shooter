import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final String text0 = 'Необходимо иметь настроенный целевой сервер';
  final String text1 =
      'Целевой сервер мог быть настроен если бы вы открыли приложение через ссылку приглашение или отсканировали qr код с этой ссылкой перед входом в приложение.\n\nОтсканировать QR код или нажать на ссылку приглашение можно и сейчас чтобы связать ваш аккаунт с аккаунтом на целевом сервере.\n\nАльтернативно, вы можете создать связь вручную введя авторизационные данные целевого сервера. Для этого нажмите на кнопку +';

  Widget logoutDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Выйти?'),
      content: Text('Вы уверены, что хотите выйти?'),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              FirebaseAuth.instance.signOut();
            },
            child: Text('Да')),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text('Нет'))
      ],
    );
    // FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.account_circle_outlined,
                          size: 40,
                        ),
                        Text(
                          'user',
                          style: TextStyle(fontSize: 30),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                      onPressed: () async {
                        showDialog<void>(
                          context: context,
                          builder: logoutDialog,
                        );
                      },
                      icon: Icon(Icons.exit_to_app_outlined),
                      alignment: Alignment.topRight,
                      iconSize: 40,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Целевой сервер'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              '\n$text0\n',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              text1,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'EnterPage');
        },
        child: Icon(Icons.add_circle_outline),
      ),
    );
  }
}
