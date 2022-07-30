// ignore_for_file: file_names, prefer_const_declarations, unused_local_variable

import 'package:ecosia/screens/home/EcoCount/EcoCount.dart';
import 'package:ecosia/screens/home/UserTask/UserTask.dart';
import 'package:ecosia/screens/home/Userprofile/UserProfile.dart';
import 'package:ecosia/screens/home/dashboard/dashboard.dart';
import 'package:ecosia/screens/home/informativepg/informativepage.dart';
import 'package:ecosia/services/auth.dart';
import 'package:flutter/material.dart';

import '../screens/wrapper.dart';

class NavigationDrawer extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  NavigationDrawer({Key? key}) : super(key: key);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
          color: Colors.white10,
          child: ListView(
            padding: padding,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              buildMenuItem(
                text: 'Dashboard',
                icon: Icons.home_outlined,
                onClicked: () => selectedItem(context, 0),
              ),
              const SizedBox(height: 12),
              buildMenuItem(
                text: 'User Profile',
                icon: Icons.person_outlined,
                onClicked: () => selectedItem(context, 1),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Eco Count',
                icon: Icons.calculate_outlined,
                onClicked: () => selectedItem(context, 2),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Informative Page',
                icon: Icons.info_outline_rounded,
                onClicked: () => selectedItem(context, 3),
              ),
              const SizedBox(height: 16),
              buildMenuItem(
                text: 'Your Tasks',
                icon: Icons.task_outlined,
                onClicked: () => selectedItem(context, 4),
              ),
              const SizedBox(height: 24),
              const Divider(color: Colors.black),
              const SizedBox(height: 24),
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
            ],
          )),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black87;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Dashboard(),
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
    }
  }
}
