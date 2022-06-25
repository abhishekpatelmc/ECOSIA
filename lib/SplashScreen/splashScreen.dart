import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled/SplashScreen/splashScreenTwo.dart';

import '../main.dart';
void main() { runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenOne(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreenOne extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}
class SplashScreenState extends State<SplashScreenOne> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => SplashScreenTwo()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,

            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: 270,
                  height: 270,
                  decoration: BoxDecoration(
                    color:const Color.fromRGBO(200, 236, 141,1),
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  child: Text("ECOSIA",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(52,157,149, 0.8 ),
                      letterSpacing: 5,
                      fontFamily: 'Linden Hill',
                      fontSize: 60,
                      shadows: [
                        Shadow(color: Colors.blueAccent, offset: Offset(2,1), blurRadius:10)
                      ],),),
                ),],
            )

        )


      // Stack(
      //   children: <Widget>[
      //     const Center(child: CircularProgressIndicator()),
      //     Center(
      //       child: Image.asset('assets/images/logo.jpg'),
      //     ),
      //   ],
      // ),

      // Center(
      //
      //     child:  Image.asset('assets/images/logo.jpg',
      //         height: 150,
      //         //width: MediaQuery.of(context).size.width,
      //         width: 150,
      //         color: Colors.white.withOpacity(0.8),
      //         colorBlendMode: BlendMode.modulate,
      //         fit:BoxFit.cover)),


    );

  }
}
// class HomeScreen extends StatelessWidget {
//
//   // Route route = MaterialPageRoute(builder: (context) => MyApp());
//   // Navigator.pushReplacement(context, route);
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//         body:Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             child: Column(
//               children:  <Widget>[
//                     const Center(child: CircularProgressIndicator()),
//                     Center(
//                       child: Image.asset('assets/images/logo2.png'),
//
//
//                     ),
//
//                 Container(
//                   child: Text("SAVE EARTH,SAVE LIFE!",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontWeight: FontWeight.w700,
//                       color: Color.fromRGBO(52,157,149, 0.8 ),
//                       letterSpacing: 5,
//                       fontFamily: 'Linden Hill',
//                       fontSize: 60,
//                       shadows: [
//                         Shadow(color: Colors.blueAccent, offset: Offset(2,1), blurRadius:10)
//                       ],),),
//                 ),],
//             )
//
//         ),
//
//
//
//
//       // Stack(
//       //   children: <Widget>[
//       //     const Center(child: CircularProgressIndicator()),
//       //     Center(
//       //       child: Image.asset('assets/images/logo.jpg'),
//       //     ),
//       //   ],
//       // ),
//
//       // Center(
//       //
//       //     child:  Image.asset('assets/images/logo.jpg',
//       //         height: 150,
//       //         //width: MediaQuery.of(context).size.width,
//       //         width: 150,
//       //         color: Colors.white.withOpacity(0.8),
//       //         colorBlendMode: BlendMode.modulate,
//       //         fit:BoxFit.cover)),
//
//
//     );
//
//   }
// }