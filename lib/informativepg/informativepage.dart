import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';


class InformativePage extends StatefulWidget {
  const InformativePage({Key? key}) : super(key: key);

  @override
  State<InformativePage> createState() => _InformativePage();
}

class _InformativePage extends State<InformativePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text(""),
        // backgroundColor: ,
        flexibleSpace: Container(
          height: 150,
          width: 600,
          decoration: const BoxDecoration(
            // borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xff0ED1C2),
                Color(0xff38EF7D),
                // Color(0xff0ED1C2),
                // Color(0xff38EF7D),
              ],
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.only(top: 30),
            child: Center(
              child: Text(
                'Ecosia Informative Page',
                style: TextStyle(fontSize: 36, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: const [
                Opacity(
                  opacity: 0.7,
                  child: Image(
                    image: NetworkImage(
                        "https://images.pexels.com/photos/2382325/pexels-photo-2382325.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  ),
                ),
                
              ],
            ),
            
            Padding(
                padding: const EdgeInsets.only(left: 30, right: 20, top: 5),
                child: InkWell(
                  child: Container(
                    height: 60,
                    // width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      gradient: const LinearGradient(
                        colors: <Color>[
                          Color(0xff0ED1C2),
                          Color(0xff38EF7D),
                          // Color(0xff0ED1C2),
                          // Color(0xff38EF7D),
                        ],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Edit User Details',
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: ()async {
                    const url = 'homeliving.co.ke';
                    if (await canLaunchUrlString(url)){
                      await launchUrlString(url);
                    }
                  }
                ),
        )
          ],
    )));
  }
}

