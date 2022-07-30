// ignore_for_file: file_names
import 'package:ecosia/shared/navigationDrawer.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';

class EcoCount extends StatefulWidget {
  const EcoCount({Key? key}) : super(key: key);

  @override
  State<EcoCount> createState() => _EcoCountState();
}

class _EcoCountState extends State<EcoCount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      drawer: NavigationDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 25, 10, 10),
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
                      'https://images.unsplash.com/photo-1533038590840-1cde6e668a91?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                      fit: BoxFit.fitHeight,
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
