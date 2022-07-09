// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 25,),

          //Hello, Again!
          Text('Hello Again!',
            style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10,),
          Text('Welcome back, You have been missed',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 50,),


          //Email TextField
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your Email ID',
                      ),
                    ),
                  )
              )
            ),
          SizedBox(height: 10,),


          //Password TextField
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your Password',
                      ),
                    ),
                  )
              )
          ),
          SizedBox(height: 15,),

          //Sign in Button
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                padding: EdgeInsets.all(20.0 ),
                decoration: BoxDecoration(color: Colors.green[300], borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Text('Sign in',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              )
          ),
          SizedBox(height: 30),

          //Not a Member? Sign up Page
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Not a Member?', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(' Register Now!',
              style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
            ]
          )

        ],),
      )
      )
    );
  }
}