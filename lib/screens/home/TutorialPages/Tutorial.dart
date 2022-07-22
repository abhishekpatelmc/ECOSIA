import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecosia/screens/wrapper.dart';

class Tutorial extends StatefulWidget {
  const Tutorial({Key? key}) : super(key: key);

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.greenAccent,
      body: CarouselSlider(
        items: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Text(
                  "Tips & Tricks to reduce waste",
                  style: TextStyle(
                      color: Colors.green[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: double.infinity,
                height: 450,
                // margin: const EdgeInsets.all(6.0),
                decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage("assets/images/Picture9.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Text(
                  "Tips & Tricks to reduce carbon emissions",
                  style: TextStyle(
                      color: Colors.green[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  // width: double.infinity,
                  height: 200,
                  // margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: const DecorationImage(
                      image: AssetImage("assets/images/Picture13.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Text(
                  "Tips & Tricks to eat healthy",
                  style: TextStyle(
                      color: Colors.green[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: double.infinity,
                height: 350,
                // margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/Picture11.png"),
                    // image: NetworkImage("https://cdn.dribbble.com/users/3524019/screenshots/16284498/media/d03e7f6dcf5f3a6973b650e3ede72920.gif"),
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Center(
                  child: ListTile(
                    // tileColor: Colors.blueGrey,
                    leading: const Icon(
                      Icons.arrow_forward_rounded,
                      size: 35,
                      color: Colors.white,
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Wrapper()));
                    },
                  ),
                ),
              ),
              // SizedBox(
              //     // width: 150.0,
              //     // height: 70.0,
              //     child: ElevatedButton(
              //         child: const Text("Get Started"),
              //         style: ElevatedButton.styleFrom(
              //             textStyle: const TextStyle(fontSize: 22)
              //         ),
              //         onPressed:(){
              //           Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const Wrapper()));
              //         })
              // ),
            ],
          ),
        ],
        options: CarouselOptions(
          height: 850,
          enlargeCenterPage: true,
          // autoPlay: true,
          // aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: false,
          autoPlayAnimationDuration: const Duration(milliseconds: 200),
          // viewportFraction: 0.8,
        ),
      ),
    );
  }
}
