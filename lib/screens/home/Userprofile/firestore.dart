import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> userSet(String name, String email, String location, String Date,
    String contact) async {
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  FirebaseAuth auth = FirebaseAuth.instance;
  String? uid = auth.currentUser?.uid.toString();
  users.add({
    'name': name,
    'email': email,
    'location': location,
    'Date': Date,
    'Conatct': contact
  });
  return;
}
