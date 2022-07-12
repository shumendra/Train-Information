// ignore_for_file: prefer_const_constructors

import 'package:androgames_assignment/main.dart';
import 'package:androgames_assignment/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const LoginPage({Key? key, required this.onClickedSignUp}) : super(key: key);
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailText = TextEditingController();
  TextEditingController pwdText = TextEditingController();

  bool _passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Center(
                  child: Text(
                'Login',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )),
              SizedBox(
                height: 50,
              ),
              //Email field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                child: TextField(
                  controller: emailText,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                ),
              ),

              //Password field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                child: TextField(
                  controller: pwdText,
                  obscureText: !_passwordVisible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                  ),
                ),
              ),

              //Login Button
              ElevatedButton(
                  onPressed: () async {
                    signIn();
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  )),
              SizedBox(
                height: 30,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'No account?  ',
                    style: TextStyle(color: Colors.black, fontSize: 16)),
                TextSpan(
                    text: 'Sign Up  ',
                    recognizer: TapGestureRecognizer()
                      ..onTap = widget.onClickedSignUp,
                    style: TextStyle(color: Colors.blue, fontSize: 16)),
              ]))
            ],
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailText.text.trim(), password: pwdText.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
