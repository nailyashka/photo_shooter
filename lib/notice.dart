import 'package:flutter/material.dart';
import 'package:open_mail_app/open_mail_app.dart';

class EmailSentPage extends StatelessWidget {
  const EmailSentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void showNoMailAppsDialog(BuildContext context) {
      showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Open Mail App"),
            content: Text("No mail apps installed"),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    }

    void openEmail() async {
      // Android: Will open mail app or show native picker.
      // iOS: Will open mail app if single mail app found.
      var result = await OpenMailApp.openMailApp();

      // If no mail apps found, show error
      if (!result.didOpen && !result.canOpen) {
        showNoMailAppsDialog(context);

        // iOS: if multiple mail apps found, show dialog to select.
        // There is no native intent/default app system in iOS so
        // you have to do it yourself.
      } else if (!result.didOpen && result.canOpen) {
        showDialog<void>(
          context: context,
          builder: (_) {
            return MailAppPickerDialog(
              mailApps: result.options,
            );
          },
        );
      }
    }

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
              onPressed: openEmail,
              child: Text('open mail'),
            )
          ],
        ),
      ),
    );
  }
}
