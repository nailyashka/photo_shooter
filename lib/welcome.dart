import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Center(child: Text('Welcome'))),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'EmailAuthenticationPage');
                },
                child: Text('Enter with e-mail')),
          )
        ],
      ),
    );
  }
}
