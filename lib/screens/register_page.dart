import 'package:blabber_all_day/screens/chat_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../components/rounded_button.dart';
import '../constants.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class RegisterPage extends StatefulWidget {
  static final String id = 'register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  String email = '';
  String password = '';
  bool wait = false;
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
                    controller: emailController,
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
                  buttonLabel: 'REGISTER',
                  colorList: [
                    Color(0xff9d98ca),
                    Color(0xffcc7384),
                    Color(0xff68d2ec),
                    Color(0xffb1e3c4),
                    Color(0xffeee668),
                    Color(0xffda5c87),
                    Color(0xff9d98ca),
                  ],
                  onPress: () async {
                    setState(() {
                      wait = true;
                    });
                    try {
                      final newUser =
                          await _auth.createUserWithEmailAndPassword(
                              email: email, password: password);
                      if (newUser != null) {
                        Navigator.pushNamed(context, ChatScreen.id);
                      }
                      setState(() {
                        wait = false;
                      });
                    } catch (e) {
                      throw Exception('Error: $e');
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
