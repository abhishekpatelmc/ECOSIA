import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import '../firebase_options.dart';

/*
Autehntication Service for Firebase
*/

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // sign in anonmously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }

    // -------------------------------------Alternatively we can use this code to test --------------------------------
    // -----------------------------------This code is coded with from officail docs ref----------------------------------
    // try {
    //   final userCredential = await FirebaseAuth.instance.signInAnonymously();
    //   User? user = userCredential.user;
    //   print("Signed in with temporary account.");
    //   return user;
    // } on FirebaseAuthException catch (e) {
    //   switch (e.code) {
    //     case "operation-not-allowed":
    //       print("Anonymous auth hasn't been enabled for this project.");
    //       break;
    //     default:
    //       print("Unknown error.");
    //       return null;
    //   }
    // }
    // ---------------------------------------Docs coded ends here ---------------------------------------
  }

  // sign in with email and password

  // register with email and password

  // sign out

}
