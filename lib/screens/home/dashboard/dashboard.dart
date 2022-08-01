// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosia/shared/loading.dart';
import 'package:ecosia/shared/navigationDrawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../TaskPages/taskDescription.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);
  // final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text("Hello user,",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24.0)),
                      Text("Today you have mutiple",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14.0)),
                      Text(
                        "tasks to complete...",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14.0),
                      ),
                    ],
                  ),
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Today's tasks",
              style: TextStyle(
                  color: Colors.green[800],
                  fontWeight: FontWeight.w500,
                  fontSize: 22.0),
            ),
            const TaskInformation(),
          ],
        ),
      ),
    );
  }
}

@override
State<StatefulWidget> createState() {
  // TODO: implement createState
  throw UnimplementedError();
}

class TaskInformation extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const TaskInformation();
  @override
  // ignore: library_private_types_in_public_api
  _TaskInformationState createState() => _TaskInformationState();
}

class _TaskInformationState extends State<TaskInformation> {
  final Stream<QuerySnapshot> _tasksStream = FirebaseFirestore.instance
      .collection('Tasks')
      .snapshots(includeMetadataChanges: true);
  var selectedIndex = [];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _tasksStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }
        return Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.fromLTRB(10, 15, 10, 0),
          child: ListView(
            children: snapshot.data!.docs.map(
              (DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      data['Name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    // subtitle: Text(data['Description']),
                    leading: IconButton(
                        icon: Icon(Icons.check_circle_outline,
                            color:
                                (selectedIndex.contains(document.reference.id))
                                    ? Color.fromARGB(255, 13, 151, 0)
                                    : Color(0xff9A9A9A)),
                        onPressed: () => {
                              setState(() {
                                if (selectedIndex
                                    .contains(document.reference.id)){
                                  addTask(document.reference.id, data['points']);
                                  selectedIndex.remove(document.reference.id);
                                }
                                else {
                                  selectedIndex.add(document.reference.id);
                                }
                              }),
                            }),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.green[300],
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TaskDesription(document.reference.id),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}

addTask(String id, int point) async {
  final prefs = await SharedPreferences.getInstance();
  String? uid;
  int totalpoint=0;
  if (prefs.containsKey("email")) {
    // setState(() {
    uid = prefs.getString("email");
    // });
    // ignore: avoid_print
    print(point);
  }
  FirebaseFirestore.instance
      .collection('users')
      .where("Email", isEqualTo: uid)
      .get()
      .then((res) => {
            totalpoint = res.docs[0].data()['Point'] + point,
            FirebaseFirestore.instance
                .collection('users')
                .doc(res.docs[0].id)
                .set({
                  'completedTasks': FieldValue.arrayUnion([
                    {
                      'ID': id,
                    },
                  ]),
                  'Point': totalpoint
                }, SetOptions(merge: true))
                // ignore: avoid_print
                .then((value) => print("Task Added"))
                // ignore: avoid_print
                .catchError((error) => print("Failed to add user: $error")),
          });
}
