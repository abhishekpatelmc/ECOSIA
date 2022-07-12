import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosia/services/auth.dart';
import 'package:flutter/material.dart';
import '../UserTask/UserTask.dart';
import '../Userprofile/UserProfile.dart';
import '../informativepg/informativepage.dart';
import '../TaskPages/taskDescription.dart';

class Dashboard extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              accountName: null,
              accountEmail: null,
              decoration: BoxDecoration(
                // image: DecorationImage(
                //   image: ExactAssetImage('assets/images/drawerbg.jpg'),
                //   fit: BoxFit.cover,
                // ),
                color: Colors.white,
              ),
              currentAccountPicture: CircleAvatar(
                  // backgroundImage: AssetImage(
                  //   'assets/images/girlicon.png',
                  // ),
                  ),
            ),
            ListTile(
              tileColor: Colors.blueGrey,
              leading: const Icon(
                Icons.supervised_user_circle,
                color: Colors.blueGrey,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => UserInfo()));
              },
              title: Text(
                "User profile",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              tileColor: Colors.blueGrey,
              leading: const Icon(
                Icons.supervised_user_circle,
                color: Colors.blueGrey,
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => InformativePage()));
              },
              title: Text(
                "Informative Page",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              tileColor: Colors.blueGrey,
              leading: const Icon(
                Icons.supervised_user_circle,
                color: Colors.blueGrey,
              ),
              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=> UserTask()));},
              title: Text("Your Tasks",style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              tileColor: Colors.blueGrey,
              leading: const Icon(
                Icons.supervised_user_circle,
                color: Colors.blueGrey,
              ),
              onTap: () async {
                await _auth.signOut();
              },
              title: Text(
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
            Container(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 200.0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10, bottom: 5, left: 50, right: 20),
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
                            padding: const EdgeInsets.only(top: 0,right: 20),
                            child: SizedBox(
                              width: 140,
                              height: 200.0,
                              child: Image.asset(
                                  'assets/images/flag.png'), // Your image widget here
                            ),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [Color.fromRGBO(14, 209, 194, 1.0), Colors.grey],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Row(
                  children: const [
                    Center(
                      child: Text("Today's Task and Progress",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0)),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 20, right: 20, left: 20),
              child:Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  // gradient: LinearGradient(
                  //   colors: [Color.fromRGBO(14, 209, 194, 1.0), Colors.grey],
                  //   begin: Alignment.bottomLeft,
                  //   end: Alignment.topRight,
                  // ),
                ),
                child: TaskInformation(),
              // ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 20, right: 20, left: 20),
            //   child: Container(
            //     height: 90,
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //       color: Colors.grey,
            //       borderRadius: BorderRadius.circular(20),
            //       // gradient: LinearGradient(
            //       //   colors: [Color.fromRGBO(14, 209, 194, 1.0), Colors.grey],
            //       //   begin: Alignment.bottomLeft,
            //       //   end: Alignment.topRight,
            //       // ),
            //     ),
            //     child: Center(child: Text("Task 2")),
            //   ),
            // ),
            // Padding(
            //   padding: EdgeInsets.only(top: 20, right: 20, left: 20),
            //   child: Container(
            //     height: 90,
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //       color: Colors.grey,
            //       borderRadius: BorderRadius.circular(20),
            //       // gradient: LinearGradient(
            //       //   colors: [Color.fromRGBO(14, 209, 194, 1.0), Colors.grey],
            //       //   begin: Alignment.bottomLeft,
            //       //   end: Alignment.topRight,
            //       // ),
            //     ),
            //     child: Center(child: Text("Task 3")),
            //   ),
            // ),
            )],
        ),
      ),
    );
  }
}


class TaskInformation extends StatefulWidget {
  @override
  _TaskInformationState createState() => _TaskInformationState();
}

class _TaskInformationState extends State<TaskInformation> {
  final Stream<QuerySnapshot> _tasksStream = FirebaseFirestore.instance.collection('Tasks').snapshots(includeMetadataChanges: true);

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
          height: 160,
          margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
          child: Center(
            child:ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return ListTile(
                  title: Text(data['Name']),
                  // subtitle: Text(data['Description']),
                  onTap: (){ Navigator.push(context,
                      MaterialPageRoute(builder:(context)=>TaskDesription(document.reference.id)));
                  }
              );
            }).toList(),
          ),),
          );
      },
    );
  }
}