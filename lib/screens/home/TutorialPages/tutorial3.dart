// import 'package:ecosia/TutorialPages/getstarted.dart';
import 'package:ecosia/screens/wrapper.dart';
import 'package:flutter/material.dart';

class Tutorial3 extends StatefulWidget {
  const Tutorial3({Key? key}) : super(key: key);

  @override
  State<Tutorial3> createState() => _Tutorial3State();
}

class _Tutorial3State extends State<Tutorial3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Text(
                  "Tips & Tricks to eat healthy",
                  style: TextStyle(
                      color: Colors.green[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                Row(
                  children: const [
                    Image(
                      image: AssetImage("assets/images/Picture11.png"),
                      height: 440,
                      width: 380,
                      fit: BoxFit.cover,
                    ),
                    // buildImageCard(),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                    width: 140.0,
                    height: 50.0,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 22)),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Wrapper()));
                        },
                        child: const Text("Next"))),
              ],
            )),
      ),
    );
  }
}

Widget buildImageCard() => Card(
        child: Stack(
      children: [
        Ink.image(
          image: const AssetImage("assets/Picture11.png"),
          height: 440,
          width: 380,
          fit: BoxFit.cover,
        )
      ],
    ));
