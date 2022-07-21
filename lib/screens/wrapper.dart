import 'package:ecosia/screens/authenticate/authenticate.dart';
import 'package:ecosia/screens/home/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecosia/models/user.dart';


// import 'home/AddTask.dart';

/*
Switch beteween Authenticate and Alerdy logged in
  - If the Signed in then it redirected to Home()
  - If Not then redirected Authenticate()
*/

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    // ignore: avoid_print
    print(user);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      // return AddTask("Walk", "Walk for 20 minutes", 10);
      return Dashboard();
    }
  }
}
