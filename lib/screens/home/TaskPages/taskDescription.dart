// import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecosia/models/tasks.dart';
import 'package:flutter/material.dart';

class TaskDesription extends StatelessWidget {
  TaskDesription(this.documentId);
  final String documentId;

  // GetUserName(this.documentId);
  @override
  Widget build(BuildContext context) {

    CollectionReference tasks = FirebaseFirestore.instance.collection('Tasks');

    return FutureBuilder<DocumentSnapshot>(
      future: tasks.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Container(
            height: 100,
            width: 100,
            child: Card(
              child: ListTile(
                title: Text("Task Name: ${data['Name']}"),
                subtitle: Text("Description: ${data['Description']}"),
              ),
              elevation: 8,
              shadowColor: Colors.green,
              margin: EdgeInsets.all(30),
            ),
          );
          // Text("Task Name: ${data['Name']} ${data['Description']}"),
        }

        return Text("loading");
      },
    );
  }
}
