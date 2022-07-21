import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosia/screens/home/LoginPage/login_page.dart';
import 'package:ecosia/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
            const UserAccountsDrawerHeader(
              accountName: null,
              accountEmail: null,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/flag.png',
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
                Icons.task_alt_outlined,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => UserTask()));
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
              },
              title: const Text(
                "Log out",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text("Hello user,",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50, right: 20),
                      child: Text("Today you have 3 ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40),
                      child: Text("tasks to complete...",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0)),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 0, right: 20),
                      child: SizedBox(
                        width: 140,
                        height: 200.0,
                        child: Image.asset(
                            'assets/images/person.png'), // Your image widget here
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(8, 10, 8, 15),
            child: Text(
              "Today's tasks",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
          ),
          const TaskInformation(),
        ],
      ),
    );
  }
}

class TaskInformation extends StatefulWidget {
  const TaskInformation({Key? key}) : super(key: key);

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
          height: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.fromLTRB(10, 15, 10,0),
          child: ListView(
            children: snapshot.data!.docs.map(
              (DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Card(
                  elevation: 6,
                  margin: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                  child: ListTile(
                    title: Text(data['Name'],
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 18)),
                    // subtitle: Text(data['Description']),
                    leading: IconButton(
                      icon: const Icon(Icons.check_circle_outline),
                      onPressed: () =>{
                        addTask(document.reference.id,data['points'])
                      },
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
  if (prefs.containsKey("email")) {
    // setState(() {
      uid = prefs.getString("email");
    // });
    print(uid);
  }

  FirebaseFirestore.instance.collection('users').where("Email", isEqualTo: uid).get().then(
        (res) => {

          // totalpoint = res.docs[0].data()['Points'] + point,
          FirebaseFirestore.instance.collection('users').doc(res.docs[0].id).set({
        'completedTasks': FieldValue.arrayUnion([
        {
          'ID': id,
        },]),
        'Point': point
        },SetOptions(merge: true))
            .then((value) => print("Task Added"))
            .catchError((error) => print("Failed to add user: $error")),
  }
  );
}