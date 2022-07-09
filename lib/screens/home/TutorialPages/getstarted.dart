// import 'package:ecosia/TutorialPages/tutorial1.dart';
import 'package:ecosia/screens/home/TutorialPages/tutorial1.dart';
import 'package:flutter/material.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin:  const EdgeInsets.only(top: 50),
          child: Column(children: [
            Text("Glad you are here, let's get started.",
              style: TextStyle(
                  color: Colors.green[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 40),textAlign: TextAlign.center,
            ),
            Row(
              children: const [
                Image(
                  image: AssetImage("assets/images/Picture13.png"),
                  height: 440,
                  width: 380,
                  fit: BoxFit.cover,
                ),
                // buildImageCard(),
              ],
            ),
            RaisedButton(
                child:Text("Get Started"),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Tutorial1()));
                }),
          ],
          )
      ),
    );
  }
}


Widget buildImageCard() => Card(
    child:Stack(
      children: [
        Ink.image(
          image: const AssetImage("assets/Picture13.png"),
          height:440,
          width: 380,
          fit:BoxFit.cover,

        )
      ],
    )
);
