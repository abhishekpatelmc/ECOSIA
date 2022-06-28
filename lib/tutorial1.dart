import 'package:ecosia/tutorial2.dart';
import 'package:flutter/material.dart';

class Tutorial1 extends StatefulWidget {
  const Tutorial1({Key? key}) : super(key: key);

  @override
  State<Tutorial1> createState() => _Tutorial1State();
}

class _Tutorial1State extends State<Tutorial1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Hello! Glad you're here, let's get started"),
      // ),

      body: Container(
          margin:  const EdgeInsets.only(top: 50),
          child: Column(children: [
            Text("Tips & Tricks to reduce waste",
              style: TextStyle(
                  color: Colors.green[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 40),textAlign: TextAlign.center,
            ),
            Row(
              children: [
                Image(
                  image: AssetImage("assets/Picture9.png"),
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
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Tutorial2()));
                }),],
          )
      ),
    );
  }
}


Widget buildImageCard() => Card(
    child:Stack(
      children: [
        Ink.image(
          image: const AssetImage("assets/Picture9.png"),
          height:440,
          width: 380,
          fit:BoxFit.cover,

        )
      ],
    )
);




