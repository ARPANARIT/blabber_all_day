import 'package:blabber_all_day/screens/login_page.dart';
import 'package:blabber_all_day/screens/register_page.dart';
import 'package:flutter/material.dart';

import '../components/rounded_button.dart';
import '../constants.dart';

class WelcomePage extends StatelessWidget {
  static final String id = 'welcome';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
            RoundedButton(
              onPress: () {
                Navigator.pushNamed(context, LoginPage.id);
              },
              colorList: [
                Color(0xff68d2ec),
                Color(0xffb1e3c4),
                Color(0xffeee668),
                Color(0xffda5c87),
                Color(0xff9d98ca),
                Color(0xffcc7384),
                Color(0xff68d2ec),
              ],
              buttonLabel: 'Login'.toUpperCase(),
            ),
            RoundedButton(
              colorList: [
                Color(0xff9d98ca),
                Color(0xffcc7384),
                Color(0xff68d2ec),
                Color(0xffb1e3c4),
                Color(0xffeee668),
                Color(0xffda5c87),
                Color(0xff9d98ca),
              ],
              buttonLabel: 'Register'.toUpperCase(),
              onPress: () {
                Navigator.pushNamed(context, RegisterPage.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
