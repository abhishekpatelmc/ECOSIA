// ignore_for_file: file_names
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosia/shared/loading.dart';
import 'package:flutter/material.dart';

class TaskDesription extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TaskDesription(this.documentId);
  final String documentId;

  // GetUserName(this.documentId);
  @override
  Widget build(BuildContext context) {
    CollectionReference tasks = FirebaseFirestore.instance.collection('Tasks');
    Map<String, double> map1 = {
      'Beginner': 0.33,
      'Intermidiate': 0.66,
      'Hard': 1.0
    };
    var rng = Random();
    int index = rng.nextInt(3);
    var key = map1.keys.elementAt(index);
    var value = map1.values.elementAt(index);

    return FutureBuilder<DocumentSnapshot>(
      future: tasks.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return const Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          final levelIndicator = LinearProgressIndicator(
              backgroundColor: const Color.fromRGBO(237, 253, 237, 0.3),
              value: value,
              valueColor: const AlwaysStoppedAnimation(Colors.yellow));

          final coursePrice = Container(
            padding: const EdgeInsets.all(7.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(15.0)),
            child: Text(
              // "\$20",
              " ${data['points']}",
              // + lesson.price.toString(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          );

          final topContentText = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 100.0),
              const Icon(
                Icons.task_rounded,
                color: Colors.white,
                size: 40.0,
              ),
              const SizedBox(
                width: 90.0,
                child: Divider(color: Colors.green),
              ),
              const SizedBox(height: 10.0),
              Text(
                "${data['Name']}",
                style: const TextStyle(color: Colors.white, fontSize: 32.0),
              ),
              const SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(flex: 1, child: levelIndicator),
                  Expanded(
                      flex: 6,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            key,
                            style: const TextStyle(color: Colors.white),
                          ))),
                  Expanded(flex: 1, child: coursePrice)
                ],
              ),
            ],
          );

          final topContent = Stack(
            children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/task_description1.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  )),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                padding: const EdgeInsets.all(40.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.green[300]),
                child: Center(
                  child: topContentText,
                ),
              ),
              Positioned(
                left: 8.0,
                top: 60.0,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios_new_rounded,
                      color: Colors.white),
                ),
              )
            ],
          );

          final bottomContentText = Text(
            "Description: \n\n${data['Description']}",
            style: const TextStyle(fontSize: 18.0),
          );

          final bottomContent = Container(
            // height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // color: Theme.of(context).primaryColor,
            padding: const EdgeInsets.all(40.0),
            child: Center(
              child: Column(
                children: <Widget>[bottomContentText],
              ),
            ),
          );

          return Scaffold(
            body: Column(
              children: <Widget>[topContent, bottomContent],
            ),
          );

          //   Scaffold(
          //   appBar: AppBar(
          //     backgroundColor: Colors.green[300],
          //     elevation: 0.0,
          //   ),
          //   body: Padding(
          //     padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
          //     child: SizedBox(
          //       height: MediaQuery.of(context).size.width,
          //       width: MediaQuery.of(context).size.width,
          //
          //       child: ListTile(
          //         title: Padding(
          //           padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          //           child: Text(
          //             "Task Name : ${data['Name']}                      ${data['points']} ",
          //             style: const TextStyle(
          //                 fontSize: 18, fontWeight: FontWeight.bold),
          //           ),
          //         ),
          //         subtitle: Text("Description: ${data['Description']}",
          //             style: const TextStyle(fontSize: 15)),
          //       ),
          //     ),
          //   ),
          // );
          // Text("Task Name: ${data['Name']} ${data['Description']}"),
        }

        return const Loading();
      },
    );
  }
}
