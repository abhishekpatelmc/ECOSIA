// ignore_for_file: file_names
import 'package:percent_indicator/percent_indicator.dart';
import 'package:ecosia/screens/home/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

import '../UserTask/UserTask.dart';
import '../Userprofile/UserProfile.dart';
import '../informativepg/informativepage.dart';

class EcoCount extends StatefulWidget {
  const EcoCount({Key? key}) : super(key: key);

  @override
  State<EcoCount> createState() => _EcoCountState();
}

class _EcoCountState extends State<EcoCount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 246, 248),
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
                        "https://cdn2.outdoorphotographer.com/2019/12/FMB_Landscapes_03.jpg"),
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dashboard()));
              },
              title: const Text(
                "Dashboard",
                style: TextStyle(color: Colors.white),
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const UserTask()));
              },
              title: const Text(
                "Your Tasks",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 25, 8, 10),
          child: Center(
            child: Column(
              children: [
                CircularPercentIndicator(
                  radius: 70.0,
                  lineWidth: 14.0,
                  percent: 0.8,
                  center: Image.asset(
                    'assets/images/person.png',
                    height: 140.0,
                    width: 140.0,
                  ),
                  progressColor: Colors.green[300],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Level 1",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                            // color: Colors.green[300],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "1000",
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Divider(
                                color: Colors.grey[900],
                                endIndent: 10,
                              ),
                              Text(
                                "carbon footprint",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "1000",
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Divider(
                                color: Colors.grey[900],
                                endIndent: 40,
                              ),
                              Text(
                                "carbon Dioxide",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "1000",
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Divider(
                                color: Colors.grey[900],
                                endIndent: 40,
                              ),
                              Text(
                                "carbon Dioxide",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "100,000",
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Divider(
                                color: Colors.grey[900],
                                endIndent: 10,
                              ),
                              Text(
                                "carbon Dioxide",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Image.network(
                      // scale: 1,
                      // alignment: Alignment.topRight,
                      fit: BoxFit.fitHeight,
                      'https://images.unsplash.com/photo-1533038590840-1cde6e668a91?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                      height: 300.0,
                      width: 150.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
