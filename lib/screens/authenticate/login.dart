// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:ecosia/screens/authenticate/signup.dart';
import 'package:ecosia/screens/home/informativepg/informativepage.dart';
import 'package:ecosia/shared/loading.dart';
import 'package:flutter/material.dart';
import 'forgot_password.dart';
import '../../../services/auth.dart';

class Login extends StatefulWidget {
  // const LoginPage({Key? key}) : super(key: key);
  final Function toggelView;
  // ignore: use_key_in_widget_constructors
  const Login({required this.toggelView});

  @override
  State<Login> createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
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
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.green[300],
              elevation: 0.0,
              centerTitle: true,
              title: const Text('Sign in to Ecosia'),
            ),
            body: SingleChildScrollView(
              child: Form(
                  key: _formKey,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                        ),

                        //Hello, Again!
                        Text(
                          'Hello Again!',
                          style: TextStyle(
                              fontSize: 36, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Welcome back, You have been missed',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 50,
                        ),
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
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),

                        //Password TextField
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
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
                                ))),
                        SizedBox(
                          height: 10,
                        ),

                        Text(
                          error,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 14.0,
                          ),
                        ),
                        //Forgot password button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ForgotPasswordPage();
                                      },
                                    ),
                                  );
                                },
                                child: Text('Forgot Password?',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 15,
                        ),
                        //Sign in Button
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Container(
                              padding: EdgeInsets.all(20.0),
                              // decoration: BoxDecoration(color: Colors.green[300], borderRadius: BorderRadius.circular(12)),
                              child: ElevatedButton(
                                onPressed: () async {
                                  setState(() => loading = true);
                                  if (_formKey.currentState!.validate()) {
                                    dynamic result = await _auth
                                        .signInEmailPassword(email, password);
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
                            )),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const InformativePage(),
                              ),
                            );
                          },
                          child: Container(
                            height: 42,
                            width: 160,
                            decoration: BoxDecoration(
                              color: Colors.orange[500],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Text(
                                'Guest login',
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    letterSpacing: 1.2,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),

                        //Not a Member? Sign up Page
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Not a Member?',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                )),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SignUp(toggelView: toggelView)),
                                    (Route<dynamic> route) => true);
                              },
                              child: Text(' Register Now!',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ));
  }
}
