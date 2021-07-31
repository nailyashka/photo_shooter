import 'package:flutter/material.dart';

class EmailSentPage extends StatelessWidget {
  const EmailSentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('was sent!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(
              Icons.email_outlined,
              size: 250,
            ),
            Text(
              'A link to enter the application has been sent to the mail. The link must be opened on this device.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('open mail'),
            )
          ],
        ),
      ),
    );
  }
}
