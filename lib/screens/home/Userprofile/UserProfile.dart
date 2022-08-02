import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosia/screens/home/Userprofile/firestore.dart';
import 'package:ecosia/screens/home/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../shared/loading.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool loading = false;
  // late Map<String, dynamic>? data;
  String? userEmail = "test@gmail.com";

  @override
  initState() {
    super.initState();
    userGet();
  }

  TextEditingController name = TextEditingController();
  // ignore: non_constant_identifier_names
  TextEditingController Contact = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController enterDate = TextEditingController();

  Future<void> userGet() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.containsKey("email")) {
        userEmail = prefs.getString("email");
        // print("userEmail $userEmail");
      }
    });
    // return userEmail;
  }

  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> data = userGet() as Map<String, dynamic>;
    // String email = userGet() as String;
    var UserData;
    print("userEmail $userEmail");
    final Stream<QuerySnapshot> _tasksStream = FirebaseFirestore.instance
        .collection('users')
        .where("Email", isEqualTo: userEmail)
        .snapshots(includeMetadataChanges: true);

    return StreamBuilder<QuerySnapshot>(
      stream: _tasksStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        UserData = snapshot.data?.docs[0].data();
        print(UserData);

        if (snapshot.hasError && !snapshot.hasData) {
          setState(() => loading = true);
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }
        return loading
            ? const Loading()
            : Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            centerTitle: true,
            title: const Text(
              "User Profile",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
            backgroundColor: Colors.white10,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
          // drawer: NavigationDrawer(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: InkWell(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                    child: Text(
                      UserData['name'] ?? "User Name",
                      style:
                      const TextStyle(fontSize: 25, color: Colors.black),
                    )),
                Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 5, horizontal: 25),
                  child: ListTile(
                    leading: const Icon(
                      Icons.phone,
                    ),
                    title: Text(UserData['Conatct'] ?? "Contact Detail"),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 5, horizontal: 25),
                  child: ListTile(
                    leading: const Icon(
                      Icons.email,
                    ),
                    title: Text(UserData['Email'] ?? "Email ID"),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 5, horizontal: 25),
                  child: ListTile(
                    leading: const Icon(
                      Icons.date_range_sharp,
                    ),
                    title: Text(UserData['Date'] ?? "Date of Birth"),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(
                      vertical: 5, horizontal: 25),
                  child: ListTile(
                    leading: const Icon(
                      Icons.location_city,
                    ),
                    title:
                    Text(UserData['location'] ?? "Location Detail"),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 15, left: 20, right: 20),
                  child: InkWell(
                    child: Container(
                      height: 50,
                      // width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.green[300],
                      ),
                      child: const Center(
                        child: Text(
                          'Edit User Details',
                          style: TextStyle(
                              fontSize: 24, color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const UserProfile()));
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController enterDate = TextEditingController();
  bool _Nvalidate = false;
  bool _Evalidate = false;
  bool _Cvalidate = false;
  bool _Lvalidate = false;
  bool _DOBvalidate = false;
  String? userEmail = "test@gmail.com";

  @override
  void initState() {
    userGet();
    enterDate.text = "";
    super.initState();
  }

  Future<void> userGet() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.containsKey("email")) {
        userEmail = prefs.getString("email");
        // print("userEmail $userEmail");
      }
    });
    // return userEmail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:
          const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Edit User profile",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white10,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: InkWell(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              // height: 200,
              width: double.infinity,
              // color: Colors.,
              child: Column(
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: TextField(
                      controller: name,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        icon: const Icon(
                          Icons.supervised_user_circle,
                          size: 30,
                        ),
                        hintText: "Name",
                        errorText: _Nvalidate ? 'Value Can\'t Be Empty' : null,
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
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        icon: const Icon(
                          Icons.email,
                          size: 30,
                        ),
                        hintText: userEmail,
                        errorText: _Evalidate ? 'Value Can\'t Be Empty' : null,
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
                      maxLength: 10,
                      controller: contact,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        icon: const Icon(
                          Icons.phone,
                          size: 30,
                        ),
                        hintText: "Contact Info",
                        errorText: _Cvalidate ? 'Value Can\'t Be Empty' : null,
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
                      controller: location,
                      keyboardType: TextInputType.streetAddress,
                      decoration: InputDecoration(
                        icon: const Icon(
                          Icons.location_city,
                          size: 30,
                        ),
                        hintText: "Location",
                        errorText: _Lvalidate ? 'Value Can\'t Be Empty' : null,
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
                        errorText: _DOBvalidate ? 'Value Can\'t Be Empty' : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onTap: () async {
                        // ignore: non_constant_identifier_names
                        DateTime? UserPickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1960),
                            lastDate: DateTime(2101));
                        if (UserPickedDate != null) {
                          // ignore: avoid_print
                          print(
                              UserPickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                          DateFormat('yyyy-MM-dd').format(UserPickedDate);
                          // ignore: avoid_print
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            enterDate.text =
                                formattedDate; //set output date to TextField value.
                          });
                        }
                      },
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(
                          top: 15, left: 40, right: 40, bottom: 15),
                      child: InkWell(
                        child: Container(
                          height: 50,
                          // width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.green[400]),
                          child: const Center(
                            child: Text(
                              'Save',
                              style:
                              TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            name.text.isEmpty ? _Nvalidate = true : _Nvalidate = false;
                            location.text.isEmpty ? _Lvalidate = true : _Lvalidate = false;
                            enterDate.text.isEmpty ? _DOBvalidate = true : _DOBvalidate = false;
                            email.text.isEmpty ? _Evalidate = true : _Evalidate = false;
                            (contact.text.isEmpty && (contact.text.length>10)) ? _Cvalidate = true : _Cvalidate = false;
                          });
                          if(_Nvalidate == false && _Evalidate == false && _Cvalidate == false && _Lvalidate == false && _DOBvalidate == false ){
                            userSet(name.text, email.text, location.text,
                                enterDate.text, contact.text);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Dashboard()));
                          }

                        },
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}