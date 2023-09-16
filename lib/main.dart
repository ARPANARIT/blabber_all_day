import 'package:blabber_all_day/screens/chat_page.dart';
import 'package:blabber_all_day/screens/login_page.dart';
import 'package:blabber_all_day/screens/register_page.dart';
import 'package:blabber_all_day/screens/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomePage.id,
      routes: {
        WelcomePage.id: (context) => WelcomePage(),
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        ChatScreen.id: (context) => ChatScreen()
      },
    );
  }
}
