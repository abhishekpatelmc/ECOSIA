// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosia/screens/home/LoginPage/login_page.dart';
// import 'package:ecosia/models/tasks.dart';
import 'package:flutter/material.dart';

class TaskDesription extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TaskDesription(this.documentId);
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
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green[300],
              elevation: 0.0,
            ),
            body: Padding(
              padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
              child: SizedBox(
                height: MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                child: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text(
                      "Task Name : ${data['Name']}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  subtitle: Text("Description: ${data['Description']}",
                      style: const TextStyle(fontSize: 15)),
                ),
              ),
            ),
          );
          // Text("Task Name: ${data['Name']} ${data['Description']}"),
        }

        return const Loading();
      },
    );
  }
}
