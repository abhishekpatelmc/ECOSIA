import 'package:ecosia/screens/authenticate/login.dart';
import 'package:ecosia/screens/authenticate/signup.dart';
import 'package:flutter/material.dart';

/*
This file to determine wheather the app redirects to Login or SignUp Page
  - Login
  - Sign Up / Register
*/
class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSgnIn = true;
// TO toggel between sign in and sign up
  void toggelView() {
    setState(() => showSgnIn = !showSgnIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSgnIn) {
      return Login(toggelView: toggelView);
    } else {
      return SignUp(toggelView: toggelView);
    }
  }
}
