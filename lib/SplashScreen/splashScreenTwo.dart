import 'dart:async';
import 'package:flutter/material.dart';

import '../main.dart';

class SplashScreenTwo extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<SplashScreenTwo> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => MyApp()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
          padding: const EdgeInsets.all(20),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children:  <Widget>[
              Center(
                child: Image.asset('assets/images/logo2.png'),
              ),

              Container(
                child: Text("SAVE EARTH, SAVE LIFE!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Color.fromRGBO(52,157,149, 0.8 ),
                    letterSpacing: 5,
                    fontFamily: 'Linden Hill',
                    fontSize: 45,
                    shadows: [
                      Shadow(color: Colors.blueAccent, offset: Offset(2,1), blurRadius:10)
                    ],),),
              ),],
          )

      ),
    );

  }
}