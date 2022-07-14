// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:ecosia/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../services/auth.dart';
// import '../../authenticate/authenticate.dart';
import '../../authenticate/register.dart';
import '../informativepg/informativepage.dart';

class LoginPage extends StatefulWidget{
  // const LoginPage({Key? key}) : super(key: key);
  final Function toggelView;
  LoginPage({required this.toggelView});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showSgnIn = true;
// TO toggel between sign in and sign up
  void toggelView() {
    setState(() => showSgnIn = !showSgnIn);
  }
  
  
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context){
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green[300],
          elevation: 0.0,
          centerTitle: true,
          title: const Text('Sign in to Ecosia'),
          actions: [
            TextButton.icon(
              onPressed: () {
                widget.toggelView();
              },
              icon: const Icon(Icons.person),
              label: const Text('Sign up'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                // backgroundColor: Colors.teal,
                textStyle: const TextStyle(
                  fontSize: 14,
                ),
              ),
            )
          ],
        ),
          body: SafeArea(
          child: Form(
            key: _formKey,
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
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: (val) =>
                          val!.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
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
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          validator: (val) => val!.length < 6
                              ? 'Enter a password bigger than 6 '
                              : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                      )
                  )
              ),
              SizedBox(height: 15,),

                Text(
                  error,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 14.0,
                  ),
                ),
              //Sign in Button
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    padding: EdgeInsets.all(20.0 ),
                    // decoration: BoxDecoration(color: Colors.green[300], borderRadius: BorderRadius.circular(12)),
                    child:
                    ElevatedButton(
                      onPressed: () async {
                        setState(() => loading = true);
                        if (_formKey.currentState!.validate()) {
                          dynamic result = await _auth.signInEmailPassword(
                              email, password);
                          if (result == null) {
                            setState(() {
                              error =
                              'couldnt sign in with those credentials';
                              loading = false;
                            });
                          }
                          // print(email);
                          // print(password);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green[600],
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          textStyle: const TextStyle(
                              letterSpacing: 1.5,
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                      child: const Text('Sign in'),
                    ),
                    // Center(
                    //   child: Text('Sign in',
                    //   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                    //   ),
                    // ),
                  )
              ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const InformativePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.orange[600],
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      textStyle: const TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 20,
                          fontWeight: FontWeight.w500)),
                  child: const Text('Guest Login'),
                ),
                SizedBox(height: 30),
              //Not a Member? Sign up Page
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a Member?', style: TextStyle(fontWeight: FontWeight.bold)),
                new GestureDetector(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) => Register(toggelView: toggelView)),
                            (Route<dynamic> route) => true);
                  },
                  child: new Text(' Register Now!',
                      style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
                ),
                ]
              )

        //       RichText(
        //   text: TextSpan(
        //       style: DefaultTextStyle.of(context).style,
        //     children: <TextSpan>[
        //       TextSpan(
        //           text: 'Not a Member?',
        //           style: TextStyle(fontSize: 10)),
        //       TextSpan(
        //           text: ' Register Now!',
        //           recognizer: TapGestureRecognizer()
        //             ..onTap = () => Navigator.of(context).push(
        //                 MaterialPageRoute(builder: (context) =>  SplashScreenOne()))
        //       )
        //     ],
        //   ),
        // ),
            ],),
          )
          ),)
        );
  }
}

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      child: Center(
        child: SpinKitChasingDots(
          color: Colors.green[500],
          size: 50.0,
        ),
      ),
    );
  }
}