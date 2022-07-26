// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosia/screens/home/LoginPage/login_page.dart';
import 'package:ecosia/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../wrapper.dart';
import '../EcoCount/EcoCount.dart';
import '../UserTask/UserTask.dart';
import '../Userprofile/UserProfile.dart';
import '../informativepg/informativepage.dart';
import '../TaskPages/taskDescription.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        elevation: 5.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: null,
              accountEmail: null,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: NetworkImage(
                        "https://i.pinimg.com/originals/86/32/d5/8632d55b6dda69565282c907475ee594.jpg"),
                    fit: BoxFit.fill),
                color: Colors.green[300],
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/person.png',
                ),
              ),
            ),
            ListTile(
              tileColor: Colors.green[300],
              leading: const Icon(
                Icons.person_outlined,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const UserInfo()));
              },
              title: const Text(
                "User profile",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              tileColor: Colors.green[300],
              leading: const Icon(
                Icons.info_outline_rounded,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const InformativePage()));
              },
              title: const Text(
                "Informative Page",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              tileColor: Colors.green[300],
              leading: const Icon(
                Icons.info_outline_rounded,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const EcoCount()));
              },
              title: const Text(
                "Eco Count",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              tileColor: Colors.green[300],
              leading: const Icon(
                Icons.task_alt_outlined,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const UserTask()));
              },
              title: const Text(
                "Your Tasks",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              tileColor: Colors.green[300],
              leading: const Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ),
              onTap: () async {
                await _auth.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Wrapper()),
                (Route<dynamic> route) => false);
              },
              title: const Text(
                "Log out",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
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
                      SizedBox(
                          height: 150,
                          width: 150,
                          child: Image(
                              image: AssetImage('assets/images/person.png'))),
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
                  color: Colors.grey[700],
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
                  elevation: 6,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(data['Name'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18)),
                    // subtitle: Text(data['Description']),
                    leading: IconButton(
                      icon: const Icon(Icons.check_circle_outline),
                      onPressed: () =>
                          {addTask(document.reference.id, data['points'])},
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
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
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? uid;
  int totalpoint;
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
            totalpoint =  res.docs[0].data()['Point'] + point,
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
