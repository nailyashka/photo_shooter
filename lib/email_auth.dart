import 'package:flutter/material.dart';

class EmailAuthenticationPage extends StatefulWidget {
  const EmailAuthenticationPage({Key? key}) : super(key: key);

  @override
  _EmailAuthenticationPageState createState() =>
      _EmailAuthenticationPageState();
}

class _EmailAuthenticationPageState extends State<EmailAuthenticationPage> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter with e-mail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'enter E-mail',
                      helperText: 'a letter will be sent to the specified mail',
                      helperStyle: TextStyle(fontSize: 16)),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'EmailSentPage');
                },
                child: Text('sent me a letter'))
          ],
        ),
      ),
    );
  }

  void go() {
    final email = emailController.text;
  }
}
