// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecosia/screens/authenticate/login.dart';
import 'package:ecosia/screens/home/Userprofile/UserProfile.dart';
import 'package:ecosia/services/auth.dart';
import 'package:ecosia/shared/loading.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final Function toggelView;

  const SignUp({Key? key, required this.toggelView}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool showSignUp = true;
  void toggelView() {
    setState(() => showSignUp = !showSignUp);
  }

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // Text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.green[100],
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.green[100],
              elevation: 0.0,
            ),
            body: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Create account',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[900],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Welcome to Ecosia, You can register here',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.green[800],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 30.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const SizedBox(height: 20.0),
                            //email address
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Email',
                                fillColor: const Color(0xFFe7edeb),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.grey[500],
                                ),
                                filled: true,
                              ),
                              validator: (val) =>
                                  val!.isEmpty ? 'Enter an email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              },
                            ),
                            const SizedBox(height: 20.0),
                            //password
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none,
                                ),
                                hintText: 'Password',
                                fillColor: const Color(0xFFe7edeb),
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.password_rounded,
                                  color: Colors.grey[500],
                                ),
                              ),
                              obscureText: true,
                              validator: (val) => val!.length < 6
                                  ? 'Enter a password bigger than 6 '
                                  : null,
                              onChanged: (val) {
                                setState(() => password = val);
                              },
                            ),
                            const SizedBox(height: 25.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    setState(() => loading = true);
                                    if (_formKey.currentState!.validate()) {
                                      dynamic result =
                                          await _auth.registerEmailPassword(
                                              email, password);
                                      if (result == null) {
                                        setState(() {
                                          error = 'Please supply a valid email';
                                          loading = false;
                                        });
                                      } else {
                                        FirebaseFirestore.instance
                                            .collection('users')
                                            .add({
                                              'Email': email,
                                            })
                                            // ignore: avoid_print
                                            .then(
                                                (value) => print("User Added"))
                                            .catchError((error) =>
                                                // ignore: avoid_print
                                                print(
                                                    "Failed to add user: $error"));

                                        // ignore: use_build_context_synchronously
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const UserProfile(),
                                          ),
                                        );
                                        // SharedPreferences prefs = await SharedPreferences.getInstance();
                                        // prefs.setString("email",email);
                                      }
                                      // print(email);
                                      // print(password);
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      primary: Colors.green[600],
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 35, vertical: 10),
                                      textStyle: const TextStyle(
                                          letterSpacing: 1.5,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                  child: const Text('Sign Up'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Login(
                                          toggelView: toggelView,
                                        ),
                                      ),
                                    );

                                    // print(email);
                                    // print(password);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      primary: Colors.blue[600],
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 35, vertical: 10),
                                      textStyle: const TextStyle(
                                          letterSpacing: 1.5,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500)),
                                  child: const Text('Sign in'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 14.0),
                            Text(
                              error,
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
