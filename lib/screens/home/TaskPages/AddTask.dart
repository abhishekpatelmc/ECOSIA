// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final String Name;
  final String description;
  final int point;

  // ignore: use_key_in_widget_constructors
  const AddTask(this.Name, this.description, this.point);

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = FirebaseFirestore.instance.collection('Tasks');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'Name': Name, // John Doe
            'Description': description,
            'Point': point // Stokes and Sons
          })
          // ignore: avoid_print
          .then((value) => print("Task Added"))
          // ignore: avoid_print
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addUser,
      child: const Text(
        "Add Task",
      ),
    );
  }
}
