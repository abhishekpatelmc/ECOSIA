// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../Userprofile/UserProfile.dart';
import '../dashboard/dashboard.dart';
import '../informativepg/informativepage.dart';
import 'package:carousel_slider/carousel_slider.dart';

class UserTask extends StatefulWidget {
  const UserTask({Key? key}) : super(key: key);

  @override
  State<UserTask> createState() => _UserTaskState();
}

class _UserTaskState extends State<UserTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              tileColor: Colors.green[300],
              leading: const Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dashboard()));
              },
              title: const Text(
                "Dasboard",
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
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Your Task List"),
        // backgroundColor: ,
        flexibleSpace: Container(
          height: 150,
          width: 600,
          decoration: const BoxDecoration(
            // borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xff0ED1C2),
                Color(0xff38EF7D),
                // Color(0xff0ED1C2),
                // Color(0xff38EF7D),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const Opacity(
            opacity: 0.8,
            child: Image(
              image: NetworkImage(
                  "https://www.businesswest.co.uk/sites/default/files/styles/event_image/public/blog/featured/shutterstock_1339316864_0.png?itok=NpRryd5d"),
            ),
          ),
          CarouselSlider(
            items: [
              Column(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://cdn.dribbble.com/users/1208688/screenshots/4083955/running.gif"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color(0xff0ED1C2),
                          Color(0xff38EF7D),
                          // Color(0xff0ED1C2),
                          // Color(0xff38EF7D),
                        ],
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                    child: const Text(
                      "Running",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black, //font color
                        letterSpacing: 2, //letter spacing
                      ),
                    ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color(0xff0ED1C2),
                          Color(0xff38EF7D),
                          // Color(0xff0ED1C2),
                          // Color(0xff38EF7D),
                        ],
                      ),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://i.pinimg.com/originals/47/03/09/4703093a70ba47001bf2c86319aae091.gif"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color(0xff0ED1C2),
                          Color(0xff38EF7D),
                          // Color(0xff0ED1C2),
                          // Color(0xff38EF7D),
                        ],
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                    child: const Text(
                        "Walking",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black, //font color
                          letterSpacing: 2, //letter spacing
                      ),
                    ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 250,
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color(0xff0ED1C2),
                          Color(0xff38EF7D),
                          // Color(0xff0ED1C2),
                          // Color(0xff38EF7D),
                        ],
                      ),
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://i.pinimg.com/originals/9d/37/f2/9d37f28579591c547cca47239bad1f2c.gif"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Text("Cycling"),
                  Container(
                    height: 100,
                    width: double.infinity,
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color(0xff0ED1C2),
                          Color(0xff38EF7D),
                          // Color(0xff0ED1C2),
                          // Color(0xff38EF7D),
                        ],
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                    child: const Text(
                      "Cycling",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black, //font color
                        letterSpacing: 2, //letter spacing
                      ),
                    ),
                    ),
                  ),
                ],
              ),
            ],
            options: CarouselOptions(
              height: 400,
              // enlargeCenterPage: true,
              autoPlay: false,
              aspectRatio: 16 / 9,
              // autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              // autoPlayAnimationDuration: Duration(milliseconds: 800),
              // viewportFraction: 0.8,
            ),
          ),
        ],
      ),
    );
  }
}
