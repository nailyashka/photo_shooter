import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class Acc {
  String fio;
  String token;

  Acc(this.fio, this.token);
}

class _MyDrawerState extends State<MyDrawer> {
  Acc? acc;

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    final prefs = await SharedPreferences.getInstance();
    final fio = prefs.getString('userName');
    final token = prefs.getString('token');

    if (fio != null && token != null) {
      setState(() {
        acc = Acc(fio, token);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.grey, shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Icon(
                          Icons.person_outline,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    IconButton(
                      onPressed: () async {
                        showDialog<void>(
                          context: context,
                          builder: logoutDialog,
                        );
                      },
                      icon: Icon(Icons.exit_to_app_outlined),
                      alignment: Alignment.topRight,
                      iconSize: 32,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  FirebaseAuth.instance.currentUser!.email!,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          if (acc == null)
            Icon(Icons.clear)
          else
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('${acc!.fio}\n${acc!.token}'),
            ),
        ],
      ),
    );
  }
}

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
