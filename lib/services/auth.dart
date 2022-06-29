import 'package:ecosia/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import '../firebase_options.dart';

/*
Autehntication Service for Firebase
*/

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Create uesr object based on FirebaseUser
  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  // Stream : auth chage user stream
  Stream<UserModel?> get user {
    return _auth
        .authStateChanges()
        //.map((User? user) => _userFromFirebaseUser(user!));
        .map(_userFromFirebaseUser);
  }

  // sign in anonmously
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
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
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return null;
    }
  }
}
