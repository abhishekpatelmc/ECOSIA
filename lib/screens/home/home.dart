import 'package:ecosia/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        elevation: 0.0,
        actions: [
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: const Icon(Icons.person),
            label: const Text('Log out'),
            style: TextButton.styleFrom(
              primary: Colors.white,
              // backgroundColor: Colors.teal,
              textStyle: const TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
