// ignore: file_names
import 'dart:async';
// import 'package:ecosia/SplashScreen/splashScreenTwo.dart';
import 'package:flutter/material.dart';

import '../TutorialPages/getstarted.dart';

//
// import '../main.dart';
// void main() { runApp(MyApp());}
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SplashScreenOne(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class SplashScreenOne extends StatefulWidget {
  const SplashScreenOne({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreenOne> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const GetStarted(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: 270,
                  height: 270,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(200, 236, 141, 1),
                    shape: BoxShape.circle,
                  ),
                ),
                const Text(
                  "ECOSIA",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Color.fromRGBO(52, 157, 149, 0.8),
                    letterSpacing: 5,
                    // fontFamily: 'Linden Hill',
                    fontSize: 60,
                    shadows: [
                      Shadow(
                          color: Colors.blueAccent,
                          offset: Offset(2, 1),
                          blurRadius: 10)
                    ],
                  ),
                ),
              ],
            )));
  }
}
