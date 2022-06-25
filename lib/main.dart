import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);
  goBack(BuildContext context){

    Navigator.pop(context);

  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyHomePage> {
 // int _count = 0;

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
               child: Text("ECOSIA Dashboard",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(53,157,149, 0.8 ),
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
