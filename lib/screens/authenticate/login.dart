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
  bool _btnActive = false;
// TO toggel between sign in and sign up
  void toggelView() {
    setState(() => showSgnIn = !showSgnIn);
  }

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  final darkGreen = Colors.green[900];

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
                icon:
                    Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Again!',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: darkGreen,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Welcome back, You have been missed',
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
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Form(
                        key: _formKey,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                //Email TextField
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'Email',
                                    fillColor: Color(0xFFe7edeb),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.grey[500],
                                    ),
                                    filled: true,
                                  ),
                                  validator: (val) =>
                                      val!.isEmpty ? 'Enter an email' : null,
                                  onChanged: (val) {
                                    setState(
                                      () => email = val,
                                    );
                                    setState(() {
                                      _btnActive =
                                          val.isNotEmpty ? true : false;
                                    });
                                  },
                                ),

                                SizedBox(
                                  height: 15,
                                ),

                                //Password TextField
                                TextFormField(
                                  // keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'Password',
                                    fillColor: Color(0xFFe7edeb),
                                    filled: true,
                                    prefixIcon: Icon(
                                      Icons.password_rounded,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                  validator: (val) => val!.length < 6
                                      ? 'Enter a password bigger than 6 '
                                      : null,
                                  obscureText: true,
                                  onChanged: (val) {
                                    setState(() {
                                      _btnActive =
                                          val.isNotEmpty ? true : false;
                                    });
                                    setState(
                                      () => password = val,
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 5,
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
                                  padding: const EdgeInsets.fromLTRB(
                                    10,
                                    5,
                                    15,
                                    10,
                                  ),
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
                                        child: Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 15,
                                ),
                                //Sign in Button
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        _btnActive == true
                                            ? _loginButton()
                                            : null;
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
                                      child: const Text('Sign in'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => SignUp(
                                                  toggelView: toggelView),
                                            ),
                                            (Route<dynamic> route) => true);
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
                                      child: const Text('Sign Up'),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 40),

                                //Not a Member? Sign up Page
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Skip Sign in',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                        )),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const InformativePage(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        ' Guest Login',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  void _loginButton() async {
    setState(() => loading = true);
    if (_formKey.currentState!.validate()) {
      dynamic result = await _auth.signInEmailPassword(email, password);
      if (result == null) {
        setState(() {
          error = 'couldnt sign in with those credentials';
          loading = false;
        });
      }
      // print(email);
      // print(password);
    }
  }
}
