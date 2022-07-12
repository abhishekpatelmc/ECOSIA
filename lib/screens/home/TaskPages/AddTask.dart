import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  final String Name;
  final String description;

  const AddTask(this.Name, this.description);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('Tasks');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
        'Name': Name, // John Doe
        'Description': description, // Stokes and Sons
      })
          .then((value) => print("Task Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addUser,
      child: Text(
        "Add Task",
      ),
    );
  }
}