import 'package:ecosia/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

/*
This file to determine wheather the app redirects to Sign-In or Register/Sign Page
  - Sign IN
  - Sign Up / Register
*/
class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return const SignIn();
  }
}
