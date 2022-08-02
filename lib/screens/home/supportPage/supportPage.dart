// ignore_for_file: camel_case_types, non_constant_identifier_names, must_be_immutable, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          "Developer support",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                child: developerCard(
                  name: 'Abhishek Patel',
                  image:
                      'https://media-exp1.licdn.com/dms/image/C4D03AQE0tmsoklKQeg/profile-displayphoto-shrink_400_400/0/1651635196030?e=1665014400&v=beta&t=zO_Il1kt7wI1WM4DrfiIuRQBivbYE7-maDX9BJVRYtw',
                  onClicked: () async {
                    const url = 'https://www.linkedin.com/in/abhishekpatelmc/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ),
              InkWell(
                child: developerCard(
                  name: 'Dhwani Hansoti',
                  image:
                      'https://media-exp1.licdn.com/dms/image/C5103AQHYPrg54ifSgQ/profile-displayphoto-shrink_400_400/0/1578026669657?e=1665014400&v=beta&t=OH2XSGr5CLjJq7UdVWrn9CbAhOrZQVkJaBe2gb2tzy4',
                  onClicked: () async {
                    const url =
                        'https://www.linkedin.com/in/dhwani-hansoti-26977a17b/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ),
              InkWell(
                child: developerCard(
                  name: 'HaniKumari Patel',
                  image:
                      'https://media-exp1.licdn.com/dms/image/C4E03AQH6MVHOjAkpSg/profile-displayphoto-shrink_400_400/0/1560598227489?e=1665014400&v=beta&t=281tj9p6y0CZSHBhSFXBvE9wZCI3GZ-qB7L8enhceQA',
                  onClicked: () async {
                    const url = 'https://www.linkedin.com/in/hani-p-428444141/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ),
              InkWell(
                child: developerCard(
                  name: 'Jaydutt Bhatt',
                  image:
                      'https://media-exp1.licdn.com/dms/image/D4E35AQHIwyU9st7wzg/profile-framedphoto-shrink_400_400/0/1629918337782?e=1660014000&v=beta&t=p4K0fp8oI4EIFBeOqnnem-Dpea2ZdIgPdBjOTuei_Z0',
                  onClicked: () async {
                    const url =
                        'https://www.linkedin.com/in/jaydutt-bhatt-94bb5b133/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ),
              InkWell(
                child: developerCard(
                  name: 'Jay Modi',
                  image:
                      'https://media-exp1.licdn.com/dms/image/C5603AQFudobEZjax0g/profile-displayphoto-shrink_400_400/0/1657257063979?e=1665014400&v=beta&t=_HHNM5LRTRdbXY5l2Wp1ic1nn5l0RQ7hT9SxzaIbmJ0',
                  onClicked: () async {
                    const url =
                        'https://www.linkedin.com/in/jay-bharatkumar-modi-13510a169/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ),
              InkWell(
                child: developerCard(
                  name: 'Jay Patel',
                  image:
                      'https://media-exp1.licdn.com/dms/image/C5603AQFaBk3C_B68pQ/profile-displayphoto-shrink_400_400/0/1589125939429?e=1665014400&v=beta&t=qvP1x5z_4lQ-LXdhx1OA1iNv7ZiLGXKIWsuYVFL30E0',
                  onClicked: () async {
                    const url = 'https://www.linkedin.com/in/jaypatel1696/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ),
              InkWell(
                child: developerCard(
                  name: 'Sherin Tharakan',
                  image:
                      'https://media-exp1.licdn.com/dms/image/C5103AQFAGQ7PBG_NYQ/profile-displayphoto-shrink_400_400/0/1538312834431?e=1665014400&v=beta&t=1zDMCa4g27ZMZ_1vYhShjoKEAR5JLjHJZXqMYMUtXZE',
                  onClicked: () async {
                    const url = 'https://www.linkedin.com/in/sherinjacob97/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget developerCard({
  required String name,
  required String image,
  required VoidCallback onClicked,
}) =>
    Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      height: 66,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(45),
        ),
        elevation: 4,
        shadowColor: Colors.grey,
        child: ListTile(
          leading: CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
              image,
            ),
          ),
          title: Text(
            name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.arrow_forward_ios,
                color: Colors.black, size: 20),
            onPressed: onClicked,
          ),
        ),
      ),
    );
