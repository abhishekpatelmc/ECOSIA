import 'package:ecosia/tutorial3.dart';
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
      body: Container(
          margin: const EdgeInsets.only(top: 50),
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
                    image: AssetImage("assets/Picture10.png"),
                    height: 440,
                    width: 380,
                    fit: BoxFit.cover,
                  ),
                  // buildImageCard(),
                ],
              ),
              RaisedButton(
                  child:Text("Next"),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Tutorial3()));
                  }),
            ],
          )),
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