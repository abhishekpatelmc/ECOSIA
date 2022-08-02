// ignore_for_file: file_names, prefer_const_declarations, unused_local_variable
import 'package:ecosia/screens/home/EcoCount/EcoCount.dart';
import 'package:ecosia/screens/home/UserTask/UserTask.dart';
import 'package:ecosia/screens/home/Userprofile/UserProfile.dart';
import 'package:ecosia/screens/home/dashboard/dashboard.dart';
import 'package:ecosia/screens/home/informativepg/informativepage.dart';
import 'package:ecosia/screens/home/supportPage/supportPage.dart';
import 'package:ecosia/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/wrapper.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  @override
  State<NavigationDrawer> createState() => _NavigationState();

}
class _NavigationState extends State<NavigationDrawer> {

  late  String userEmail = "hanikumari1998@gmail.com";
   late  String userName = "Hani,";
  final AuthService _auth = AuthService();
  final padding = const EdgeInsets.fromLTRB(0, 10, 0, 0);

  @override
  void initState() {
    userGet();
    super.initState();
  }

  Future<void> userGet() async {
    final prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey("email")) {
        userEmail = prefs.getString("email")!;
        userName = prefs.getString("name")!;
        print("userEmail $userEmail");
      }
    // return userEmail;
  }

  @override
  Widget build(BuildContext context) {

    final name = userName;
    final email = userEmail;
    final urlImage =
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';
    return Drawer(
      child: Material(
          color: Colors.white10,
          child: ListView(
            padding: padding,
            children: <Widget>[
              buildHeader(
                urlImage: urlImage,
                name: name,
                email: email,
                onClicked: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UserInfo(),
                  ));
                },
              ),
              const SizedBox(
                height: 10,
              ),
              // buildMenuItem(
              //   text: 'Dashboard',
              //   icon: Icons.home_outlined,
              //   onClicked: () => selectedItem(context, 0),
              // ),
              // const SizedBox(height: 12),
              // buildMenuItem(
              //   text: 'User Profile',
              //   icon: Icons.person_outlined,
              //   onClicked: () => selectedItem(context, 1),
              // ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Eco Count',
                icon: Icons.calculate_outlined,
                onClicked: () => selectedItem(context, 2),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Your Tasks',
                icon: Icons.task_outlined,
                onClicked: () => selectedItem(context, 4),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Informative Page',
                icon: Icons.info_outline_rounded,
                onClicked: () => selectedItem(context, 3),
              ),
              const SizedBox(height: 16),
              const Divider(
                color: Colors.black,
                indent: 20,
                endIndent: 20,
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Log out',
                icon: Icons.logout_rounded,
                onClicked: () async {
                  await _auth.signOut();
                  // ignore: use_build_context_synchronously
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const Wrapper()),
                      (Route<dynamic> route) => false);
                },
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Support',
                icon: Icons.support_agent_rounded,
                onClicked: () => selectedItem(context, 5),
              ),
            ],
          )),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(
            const EdgeInsets.fromLTRB(
              20,
              30,
              0,
              10,
            ),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(urlImage),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black87;
    final darkGreen = Colors.green[800];

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        0,
        0,
        10,
      ),
      child: ListTile(
        leading: Icon(icon, color: darkGreen, size: 30),
        title: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        onTap: onClicked,
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>  const Dashboard(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const UserInfo(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const EcoCount(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const InformativePage(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const UserTask(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const SupportPage(),
        ));
        break;
    }
  }
}
