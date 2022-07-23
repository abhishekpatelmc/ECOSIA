import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> userSet(String name, String email, String location, String Date,
    String contact) async {
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  // FirebaseAuth auth = FirebaseAuth.instance;
  // String? uid = auth.currentUser?.uid.toString();


  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? email;
  if (prefs.containsKey("email")) {
    // setState(() {
    email = prefs.getString("email");
    // });
    // ignore: avoid_print
    print(email);
  }

  // users.add({
  //   'name': name,
  //   'email': email,
  //   'location': location,
  //   'Date': Date,
  //   'Conatct': contact
  // });

      users.where("Email", isEqualTo: email)
      .get()
      .then((res) => {
    FirebaseFirestore.instance
        .collection('users')
        .doc(res.docs[0].id)
        .set({
      'name': name,
      'email': email,
      'location': location,
      'Date': Date,
      'Conatct': contact
    }, SetOptions(merge: true))
        .then((value) => print("User Info Added"))
        .catchError((error) => print("Failed to add user info: $error")),
  });

  return;
}
