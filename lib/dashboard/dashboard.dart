import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MemberProfile(),
  ));
}

class MemberProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(child: ListView(
        children: [
          ListTile(leading: Icon(Icons.supervised_user_circle,color: Colors.blueGrey,
          ),
          title: Text("User profile"),
          // onTap: Navigator.push(context, MaterialPageRoute(builder: (context)=> User),),

        ],
      ),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child:Container(

              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: 200.0,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: const [
                        Padding(
                          padding: EdgeInsets.only(top: 10,bottom: 5,left: 50, right: 20),
                          child: Text("Hello user,",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 50, right: 20),
                          child: Text("Today you have 3 ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 40),
                          child: Text("tasks to complete...",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0)),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.only(top: 0),
                          child: SizedBox(
                            width: 200.0,
                            height: 200.0,
                            child: Image.asset(
                                'assets/images/dashboard_icon.png'), // Your image widget here
                          ),
                        ),

                      ],
                    ),

                  ]
              ),
            ),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [Color.fromRGBO(14, 209, 194, 1.0), Colors.grey],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Row(
                  children: const [
                    Center(
                      child: Text(
                          "Today's Task and Progress",
                              style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0)
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20,right: 20,left: 20),
              child: Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  // gradient: LinearGradient(
                  //   colors: [Color.fromRGBO(14, 209, 194, 1.0), Colors.grey],
                  //   begin: Alignment.bottomLeft,
                  //   end: Alignment.topRight,
                  // ),
                ),
                child: Center(child: Text("Task 1")),

              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20,right: 20,left: 20),
              child: Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  // gradient: LinearGradient(
                  //   colors: [Color.fromRGBO(14, 209, 194, 1.0), Colors.grey],
                  //   begin: Alignment.bottomLeft,
                  //   end: Alignment.topRight,
                  // ),
                ),
                child: Center(child: Text("Task 2")),

              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20,right: 20,left: 20),
              child: Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  // gradient: LinearGradient(
                  //   colors: [Color.fromRGBO(14, 209, 194, 1.0), Colors.grey],
                  //   begin: Alignment.bottomLeft,
                  //   end: Alignment.topRight,
                  // ),
                ),
                child: Center(child: Text("Task 3")),

              ),
            ),

          ],

        ),
      ),

    );
  }

}