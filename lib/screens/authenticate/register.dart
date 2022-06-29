import 'package:ecosia/screens/authenticate/sign_in.dart';
import 'package:ecosia/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggelView;

  Register({required this.toggelView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();

  // Text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        elevation: 0.0,
        centerTitle: true,
        title: const Text('Sign up to Ecosia'),
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggelView();
            },
            icon: Icon(Icons.person),
            label: Text('Sign in'),
            style: TextButton.styleFrom(
              primary: Colors.white,
              //backgroundColor: Colors.teal,
              textStyle: const TextStyle(
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
            child: Column(
          children: [
            const SizedBox(height: 20.0),
            //email address
            TextFormField(
              onChanged: (val) {
                setState(() => email = val);
              },
            ),
            const SizedBox(height: 20.0),
            //password
            TextFormField(
              obscureText: true,
              onChanged: (val) {
                setState(() => password = val);
              },
            ),
            const SizedBox(height: 25.0),
            ElevatedButton(
              onPressed: () async {
                print("Email: $email");
                print("Password: $password");
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.green[600],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  textStyle: const TextStyle(
                      letterSpacing: 1.5,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
              child: const Text('Register'),
            ),
          ],
        )),
      ),
    );
  }
}
