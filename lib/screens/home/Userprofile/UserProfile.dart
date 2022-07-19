import 'package:ecosia/screens/home/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ecosia/services/auth.dart';
import '../../wrapper.dart';
import '../informativepg/informativepage.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  final AuthService _auth = AuthService();

  TextEditingController name = TextEditingController();
  TextEditingController Contact = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController enterDate = TextEditingController();

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
                Icons.info_outline_rounded,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => InformativePage()));
              },
              title: const Text(
                "Informative Page",
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
                // ignore: use_build_context_synchronously
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Wrapper()),
                  (Route<dynamic> route) => false,
                );
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
            Stack(
              children: [
                const Opacity(
                  opacity: 0.7,
                  child: Image(
                    image: NetworkImage(
                        "https://images.pexels.com/photos/2382325/pexels-photo-2382325.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            color: Colors.teal),
                        height: 150,
                        width: 150,
                        child: const Image(
                          image: AssetImage("assets/images/flag.png"),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Center(
                child: Text(
              "User's name",
              style: TextStyle(fontSize: 25, color: Colors.black),
            )),
            const Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                ),
                title: Text("2269751234"),
              ),
            ),
            const Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                ),
                title: Text("user@email.com"),
              ),
            ),
            const Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.date_range_sharp,
                ),
                title: Text("1999-30-06"),
              ),
            ),
            const Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: ListTile(
                leading: Icon(
                  Icons.location_city,
                ),
                title: Text("Windsor, Ontario"),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
                child: InkWell(
                  child: Container(
                    height: 50,
                    // width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color(0xff0ED1C2),
                          Color(0xff38EF7D),
                          // Color(0xff0ED1C2),
                          // Color(0xff38EF7D),
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Edit User Details',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const UserProfile()));
                  },
                )),
          ],
        ),
      ),
    );
  }
}

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController enterDate = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    enterDate.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
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
          child: const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Center(
              child: Text(
                'Edit User profile',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              const Opacity(
                opacity: 0.7,
                child: Image(
                  image: NetworkImage(
                      "https://images.pexels.com/photos/2382325/pexels-photo-2382325.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          color: Colors.teal),
                      height: 150,
                      width: 150,
                      child: const Image(
                        image: AssetImage("assets/images/flag.png"),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 230),
                // height: 200,
                width: double.infinity,
                // color: Colors.,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 60, left: 20, right: 20),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          icon: const Icon(
                            Icons.supervised_user_circle,
                            size: 30,
                          ),
                          hintText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 20, right: 20),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          icon: const Icon(
                            Icons.email,
                            size: 30,
                          ),
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 20, right: 20),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          icon: const Icon(
                            Icons.phone,
                            size: 30,
                          ),
                          hintText: "Contact Info",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 15, left: 20, right: 20),
                      child: TextField(
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                          icon: const Icon(
                            Icons.location_city,
                            size: 30,
                          ),
                          hintText: "Location",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 20, right: 20),
                        child: TextField(
                            controller: enterDate,
                            readOnly: true,
                            // keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                              icon: const Icon(
                                Icons.date_range_sharp,
                                size: 30,
                              ),
                              hintText: "User's Birth Date",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onTap: () async {
                              DateTime? UserPickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1960),
                                  lastDate: DateTime(2101));
                              if (UserPickedDate != null) {
                                print(
                                    UserPickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate = DateFormat('yyyy-MM-dd')
                                    .format(UserPickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  enterDate.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              }
                            })),
                    Padding(
                        padding:
                            const EdgeInsets.only(top: 15, left: 20, right: 20),
                        child: InkWell(
                          child: Container(
                            height: 50,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                colors: <Color>[
                                  Color(0xff0ED1C2),
                                  Color(0xff38EF7D),
                                  // Color(0xff0ED1C2),
                                  // Color(0xff38EF7D),
                                ],
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Change password',
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                            ),
                          ),
                          onTap: () {},
                        )),
                    Padding(
                        padding: const EdgeInsets.only(
                            top: 15, left: 20, right: 20, bottom: 15),
                        child: InkWell(
                          child: Container(
                            height: 50,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(
                                colors: <Color>[
                                  Color(0xff0ED1C2),
                                  Color(0xff38EF7D),
                                  // Color(0xff0ED1C2),
                                  // Color(0xff38EF7D),
                                ],
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Save',
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => UserInfo()));
                          },
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
