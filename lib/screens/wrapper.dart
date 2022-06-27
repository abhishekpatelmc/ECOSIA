import 'package:ecosia/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';

/*
Switch beteween Authenticate and Alerdy logged in
  - If the Signed in then it redirected to Home()
  - If Not then redirected Authenticate()
*/

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return either the Home or Authenticate widget
    return const Authenticate();
  }
}
