import 'package:ecosia/screens/home/informativepg/informativepage.dart';
import 'package:ecosia/services/auth.dart';
import 'package:ecosia/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggelView;
  // ignore: use_key_in_widget_constructors
  const SignIn({required this.toggelView});

  @override
  // ignore: library_private_types_in_public_api
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
            body: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 20.0),
                      //email address
                      TextFormField(
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
                      const SizedBox(height: 20.0),
                      //password
                      TextFormField(
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
                      const SizedBox(height: 50.0),
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
                      const SizedBox(height: 14.0),
                      Text(
                        error,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 10.0),
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
                      )
                    ],
                  )),
            ),
          );
  }
}
