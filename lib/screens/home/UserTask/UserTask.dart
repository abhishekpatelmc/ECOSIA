// ignore_for_file: file_names, prefer_interpolation_to_compose_strings, avoid_print
import 'dart:convert';
import 'package:flutter/material.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: taskList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.green[100],
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(
                        taskList[index]['id'],
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      leading: IconButton(
                        icon: const Icon(
                          Icons.check_circle,
                          size: 28,
                          color: Color.fromARGB(255, 13, 151, 0),
                        ),
                        onPressed: () => {},
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
