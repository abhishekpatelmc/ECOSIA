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
      body: CarouselSlider(
        items:  [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
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
                height: 400,
                // margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/Picture13.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  "Tips & Tricks to reduce carbon emissions",
                  style: TextStyle(
                      color: Colors.green[800],
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: double.infinity,
                height: 400,
                // margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/Picture10.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
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
                height: 400,
                // margin: const EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/Picture11.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                  // width: 150.0,
                  // height: 70.0,
                  child: ElevatedButton(
                      child: const Text("Get Started"),
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(fontSize: 22)
                      ),
                      onPressed:(){
                        Navigator.of(context).push(MaterialPageRoute(builder:(context)=>const Wrapper()));
                      })
              ),
            ],
          ),
        ],
        options: CarouselOptions(
          height: 750,
          enlargeCenterPage: true,
          // autoPlay: true,
          // aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: false,
          autoPlayAnimationDuration: Duration(milliseconds: 200),
          // viewportFraction: 0.8,
        ),
      ),
    );
  }
}
