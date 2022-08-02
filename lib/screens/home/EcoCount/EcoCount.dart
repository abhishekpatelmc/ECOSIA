// ignore_for_file: file_names, avoid_print, prefer_interpolation_to_compose_strings, avoid_function_literals_in_foreach_calls
import 'dart:convert';

import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EcoCount extends StatefulWidget {
  const EcoCount({Key? key}) : super(key: key);

  @override
  State<EcoCount> createState() => _EcoCountState();
}

class _EcoCountState extends State<EcoCount> {
  double value = 0;
  int level = 0;
  dynamic points = 0;
  dynamic cd = 320;
  dynamic cf = 0;
  dynamic tasks = "";
  var taskList = [];

  Future<void> getTaskList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    tasks = prefs.getString("tasks");
    setState(() {
      taskList = json.decode(tasks);
      value = taskList.length * 25;
      level = taskList.length * 25;
      taskList.forEach((element) {
        points += element['points'];
      });
      cf = points * 0.276;
      cd += cf;
    });
    print("retrive " + cd);
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
        centerTitle: true,
        title: const Text(
          "Eco count",
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
          child: Center(
            child: Column(
              children: [
                CircularPercentIndicator(
                  radius: 70.0,
                  lineWidth: 14.0,
                  percent: (value % 100) / 100,
                  backgroundColor: Colors.white10,
                  circularStrokeCap: CircularStrokeCap.round,
                  animationDuration: 1200,
                  animation: true,
                  center: const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
                    ),
                  ),
                  progressColor: const Color.fromARGB(255, 67, 168, 60),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Level ",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      (level / 100 + 1).floor().toString(),
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.green[600],
                      ),
                    ),
                  ],
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
                                (points > 0) ? cd.toString() : 0.toString(),
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green[600],
                                ),
                              ),
                              Divider(
                                height: 10,
                                color: Colors.grey[900],
                                endIndent: 10,
                              ),

                              Text(
                                "Carbon Cost",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                (points > 0)
                                    ? cf.toStringAsFixed(2)
                                    : 0.toString(),
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green[600],
                                ),
                              ),
                              Divider(
                                height: 10,
                                color: Colors.grey[900],
                                endIndent: 40,
                              ),
                              Text(
                                "Carbon Footprint",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                points.toString(),
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.green[600],
                                ),
                              ),
                              Divider(
                                height: 10,
                                color: Colors.grey[900],
                                endIndent: 60,
                              ),
                              Text(
                                "Points",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),

                              // const SizedBox(
                              //   height: 15,
                              // ),
                              // Text(
                              //   "100,000",
                              //   style: TextStyle(
                              //     fontSize: 30.0,
                              //     fontWeight: FontWeight.w500,
                              //     color: Colors.grey[600],
                              //   ),
                              // ),
                              // Divider(
                              //   height: 10,
                              //   color: Colors.grey[900],
                              //   endIndent: 10,
                              // ),
                              // Text(
                              //   "Carbon Dioxide",
                              //   style: TextStyle(
                              //     fontSize: 20.0,
                              //     fontWeight: FontWeight.w500,
                              //     color: Colors.grey[600],
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Image.network(
                      // scale: 1,
                      'https://cdn-icons-png.flaticon.com/512/902/902543.png?w=740&t=st=1659399128~exp=1659399728~hmac=a7683694f6f1628083a7d79b437757d4203fb6d84b161a8d4af689f6138c1d07',
                      alignment: Alignment.center,
                      fit: BoxFit.fitWidth,
                      height: 240.0,
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
