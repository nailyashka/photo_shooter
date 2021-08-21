import 'package:flutter/material.dart';
import 'package:photo_shooter/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final String text0 = 'Необходимо иметь настроенный целевой сервер';
  final String text1 =
      'Целевой сервер мог быть настроен если бы вы открыли приложение через ссылку приглашение или отсканировали qr код с этой ссылкой перед входом в приложение.\n\nОтсканировать QR код или нажать на ссылку приглашение можно и сейчас чтобы связать ваш аккаунт с аккаунтом на целевом сервере.\n\nАльтернативно, вы можете создать связь вручную введя авторизационные данные целевого сервера. Для этого нажмите на кнопку +';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
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
