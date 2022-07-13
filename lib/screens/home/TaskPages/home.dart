import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecosia/models/tasks.dart';
import 'package:ecosia/screens/home/TaskPages/taskDescription.dart';
import 'package:ecosia/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        elevation: 0.0,
        actions: [
          TextButton.icon(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: const Icon(Icons.person),
            label: const Text('Log out'),
            style: TextButton.styleFrom(
              primary: Colors.white,
              // backgroundColor: Colors.teal,
              textStyle: const TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
      body: TaskInformation(),
    );
  }
}

class TaskInformation extends StatefulWidget {
  @override
  _TaskInformationState createState() => _TaskInformationState();
}

class _TaskInformationState extends State<TaskInformation> {
  final Stream<QuerySnapshot> _tasksStream = FirebaseFirestore.instance
      .collection('Tasks')
      .snapshots(includeMetadataChanges: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _tasksStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Container(
          height: 40,
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
                title: Text(data['Name']),
                subtitle: Text(data['Description']),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TaskDesription(document.reference.id)));
                });
          }).toList(),
        ),);
      },
    );
  }
}
