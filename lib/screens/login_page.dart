import 'package:blabber_all_day/components/rounded_button.dart';
import 'package:blabber_all_day/screens/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class LoginPage extends StatefulWidget {
  static final String id = 'login';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  final _auth = FirebaseAuth.instance;
  bool wait = false;

  @override
  void initState() {}

  @override
  void dispose() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          color: Color(0xffda5c87),
        ),
        inAsyncCall: wait,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset('images/paris.png'),
                ),
              ),
              Container(
                child: Text(
                  'Blabber All Day',
                  textAlign: TextAlign.center,
                  style: appName,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: gradientDecoration,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: TextField(
                    onChanged: (val) {
                      email = val;
                    },
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    decoration: textFieldDecoration.copyWith(
                        hintText: 'Enter Your Email'),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: gradientDecoration,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: TextField(
                    onChanged: (val) {
                      password = val;
                    },
                    obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: textFieldDecoration.copyWith(
                        hintText: 'Enter Password'),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RoundedButton(
                  buttonLabel: 'LOGIN',
                  colorList: [
                    Color(0xff68d2ec),
                    Color(0xffb1e3c4),
                    Color(0xffeee668),
                    Color(0xffda5c87),
                    Color(0xff9d98ca),
                    Color(0xffcc7384),
                    Color(0xff68d2ec),
                  ],
                  onPress: () async {
                    setState(() {
                      wait = true;
                    });
                    try {
                      final user = _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        wait = false;
                      });
                    } catch (e) {
                      throw Exception('error: ${e}');
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
