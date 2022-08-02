// ignore_for_file: prefer_const_constructors, sort_child_properties_last, annotate_overrides, avoid_print, use_build_context_synchronously, prefer_const_declarations

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  Future passwordreset() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      final text = "The mail has been sent to provided email address";
      final snackbar = SnackBar(
        content: Text(text),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      print(e);
      final text = e.message.toString();
      final snackbar = SnackBar(
        content: Text(text),
        action: SnackBarAction(
          label: 'Dismiss',
          onPressed: () {
            emailController.clear();
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      Navigator.of(context).pop();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              'Enter your email address and we will send you password reset instructions',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
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
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your Email ID',
                      ),
                    ),
                  ))),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () => passwordreset(),
            child: Text(
              'Reset Password',
            ),
            color: Colors.greenAccent,
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
