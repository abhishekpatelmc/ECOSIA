// import 'package:ecosia/Tutorial%20Pages/tutorial3.dart';

import 'package:ecosia/screens/home/TutorialPages/tutorial3.dart';
import 'package:flutter/material.dart';

class Tutorial2 extends StatefulWidget {
  const Tutorial2({Key? key}) : super(key: key);

  @override
  State<Tutorial2> createState() => _Tutorial2State();
}

class _Tutorial2State extends State<Tutorial2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Text(
                  "Tips & Tricks to reduce carbon emissions",
                  style: TextStyle(
                      color: Colors.green[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: const [
                    Image(
                      image: AssetImage("assets/images/Picture10.png"),
                      height: 440,
                      width: 380,
                      fit: BoxFit.cover,
                    ),
                    // buildImageCard(),
                  ],
                ),
                const SizedBox(height: 7),
                SizedBox(
                    width: 140.0,
                    height: 50.0,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 22)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Tutorial3()));
                        },
                        child: const Text("Next"))),
              ],
            )),
      ),
    );
  }
}

//
// Widget buildImageCard() => Card(
//     child:Stack(
//       children: [
//         Ink.image(
//           image: const AssetImage("assets/Picture10.png"),
//
//
//         )
//       ],
//     )
// );

