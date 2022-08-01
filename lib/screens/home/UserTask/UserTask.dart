// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserTask extends StatefulWidget {
  const UserTask({Key? key}) : super(key: key);

  @override
  State<UserTask> createState() => _UserTaskState();
}

class _UserTaskState extends State<UserTask> {
  // var sample = ["macro", "micro"];
  var taskList = [];
  dynamic tasks = "";

  Future<void> getTaskList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tasks = prefs.getString("tasks");
    setState(() {
      taskList = json.decode(tasks);
    });
    print("retrive " + tasks);
  }

  @override
  void initState() {
    super.initState();
    getTaskList();
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
        // drawer: NavigationDrawer(),
        centerTitle: true,
        title: const Text(
          "Your Completed Tasks",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: taskList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Color.fromARGB(255, 13, 151, 0),
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.center,
                    child: Text(
                      taskList[index]['id'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  );
                }),
          )
          // CarouselSlider(
          //   items: [
          //     Column(
          //       children: [
          //         Container(
          //           height: 250,
          //           width: double.infinity,
          //           margin: const EdgeInsets.all(6.0),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(8.0),
          //             image: const DecorationImage(
          //               image: NetworkImage(
          //                   "https://cdn.dribbble.com/users/1208688/screenshots/4083955/running.gif"),
          //               fit: BoxFit.cover,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           height: 100,
          //           width: double.infinity,
          //           margin: const EdgeInsets.all(8),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(8.0),
          //             gradient: const LinearGradient(
          //               colors: <Color>[
          //                 Color(0xff0ED1C2),
          //                 Color(0xff38EF7D),
          //                 // Color(0xff0ED1C2),
          //                 // Color(0xff38EF7D),
          //               ],
          //             ),
          //           ),
          //           child: const Text("Running"),
          //         ),
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         Container(
          //           height: 250,
          //           width: double.infinity,
          //           margin: const EdgeInsets.all(6.0),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(8.0),
          //             gradient: const LinearGradient(
          //               colors: <Color>[
          //                 Color(0xff0ED1C2),
          //                 Color(0xff38EF7D),
          //                 // Color(0xff0ED1C2),
          //                 // Color(0xff38EF7D),
          //               ],
          //             ),
          //             image: const DecorationImage(
          //               image: NetworkImage(
          //                   "https://i.pinimg.com/originals/47/03/09/4703093a70ba47001bf2c86319aae091.gif"),
          //               fit: BoxFit.cover,
          //             ),
          //           ),
          //         ),
          //         Container(
          //           height: 100,
          //           width: double.infinity,
          //           margin: const EdgeInsets.all(8),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(8.0),
          //             gradient: const LinearGradient(
          //               colors: <Color>[
          //                 Color(0xff0ED1C2),
          //                 Color(0xff38EF7D),
          //                 // Color(0xff0ED1C2),
          //                 // Color(0xff38EF7D),
          //               ],
          //             ),
          //           ),
          //           child: const Text("Walking"),
          //         ),
          //       ],
          //     ),
          //     Column(
          //       children: [
          //         Container(
          //           width: double.infinity,
          //           height: 250,
          //           margin: const EdgeInsets.all(6.0),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(8.0),
          //             gradient: const LinearGradient(
          //               colors: <Color>[
          //                 Color(0xff0ED1C2),
          //                 Color(0xff38EF7D),
          //                 // Color(0xff0ED1C2),
          //                 // Color(0xff38EF7D),
          //               ],
          //             ),
          //             image: const DecorationImage(
          //               image: NetworkImage(
          //                   "https://i.pinimg.com/originals/9d/37/f2/9d37f28579591c547cca47239bad1f2c.gif"),
          //               fit: BoxFit.cover,
          //             ),
          //           ),
          //         ),
          //         // Text("Cycling"),
          //         Container(
          //           height: 100,
          //           width: double.infinity,
          //           margin: const EdgeInsets.all(8),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(8.0),
          //             gradient: const LinearGradient(
          //               colors: <Color>[
          //                 Color(0xff0ED1C2),
          //                 Color(0xff38EF7D),
          //                 // Color(0xff0ED1C2),
          //                 // Color(0xff38EF7D),
          //               ],
          //             ),
          //           ),
          //           child: const Text("Cycling"),
          //         ),
          //       ],
          //     ),
          //   ],
          //   options: CarouselOptions(
          //     height: 400,
          //     // enlargeCenterPage: true,
          //     autoPlay: false,
          //     aspectRatio: 16 / 9,
          //     // autoPlayCurve: Curves.fastOutSlowIn,
          //     enableInfiniteScroll: true,
          //     // autoPlayAnimationDuration: Duration(milliseconds: 800),
          //     // viewportFraction: 0.8,
          //   ),
          // ),
        ],
      ),
    );
  }
}
