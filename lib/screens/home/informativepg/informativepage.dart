// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
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
          title: const Text("Informative Page"),
          backgroundColor: Colors.green[300],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
              child: Column(children: [
            InkWell(

                child: customCard(
                  name: 'Articles',
                  image:
                      'https://img.icons8.com/parakeet/50/000000/experimental-news-parakeet.png',
                ),
                onTap: () async {
                  _launchURL3();
                }),
            InkWell(
                child: customCard(
                  name: 'Get involved',
                  image: 'https://img.icons8.com/color/50/000000/get-along.png',
                ),
                onTap: () async {
                  _launchURL4();
                }),

            InkWell(
                child: customCard(

                  name: 'Videos',
                  image:
                      'https://img.icons8.com/external-anggara-flat-anggara-putra/50/000000/external-video-ui-basic-anggara-flat-anggara-putra-2.png',
                ),
                onTap: () async {
                  _launchURL2();
                }),
            InkWell(
                child: customCard(
                  name: 'Connect',
                  image:
                      'https://img.icons8.com/fluency/50/000000/handshake.png',
                ),
                onTap: () async {
                  _launchURL5();
                }),
            InkWell(
                child: customCard(
                  name: 'Share Feedback',
                  image:
                      'https://img.icons8.com/external-filled-outline-wichaiwi/50/000000/external-Feedback-business-filled-outline-wichaiwi.png',
                ),
                onTap: () async {
                  _launchURL2();
                }),
          ])),
        ));
  }

  _launchURL2() async {
    const url = 'https://www.youtube.com/watch?v=X2YgM1Zw4_E';
    if (await launchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL3() async {
    const url =
        'https://www.nytimes.com/guides/year-of-living-better/how-to-reduce-your-carbon-footprint';
    if (await launchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURL4() async {
    const url = 'https://www.foei.org/';
    if (await launchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
 _launchURL5() async {
    const url = 'https://oen.ca/';
    if (await launchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }





// ignore: camel_case_types, must_be_immutable
class customCard extends StatelessWidget {
  String name;
  String image;
  customCard({
    required this.name,
    required this.image,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      height: 95,
      width: double.infinity,
      child: Card(
        elevation: 8,
        shadowColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 15, 10, 0),
          child: ListTile(
            leading: Image.network(
              image,
              alignment: Alignment.topLeft,
              fit: BoxFit.fitHeight,
            ),
            title: Text(
              name,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
