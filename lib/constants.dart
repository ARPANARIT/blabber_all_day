import 'package:flutter/material.dart';

const appName = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  fontFamily: 'Baby',
);

const buttonlabels = TextStyle(
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
  fontSize: 28,
);

const colorListDefault = [
  Color(0xff68d2ec),
  Color(0xffb1e3c4),
  Color(0xffeee668),
  Color(0xffda5c87),
  Color(0xff9d98ca),
  Color(0xffcc7384),
  Color(0xff68d2ec)
];
const chatBubbleMe = [
  Color(0xffda5c87),
  Color(0xff9d98ca),
  Color(0xffcc7384),
  Color(0xff68d2ec),
  Color(0xffb1e3c4),
  Color(0xffeee668),
  Color(0xffda5c87),
];
const chatBubbleYou = [
  Color(0xff68d2ec),
  Color(0xffb1e3c4),
  Color(0xffeee668),
  Color(0xffda5c87),
  Color(0xff9d98ca),
  Color(0xffcc7384),
  Color(0xff68d2ec),
];
const radiusMe = BoxDecoration(
    gradient: SweepGradient(
      center: FractionalOffset.center,
      colors: chatBubbleMe,
      stops: <double>[0.0, 0.16667, 0.33333, 0.5, 0.66667, 0.83333, 1.0],
    ),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      bottomLeft: Radius.circular(30),
      bottomRight: Radius.circular(30),
    ));
const radiusYou = BoxDecoration(
    gradient: SweepGradient(
      center: FractionalOffset.center,
      colors: chatBubbleYou,
      stops: <double>[0.0, 0.16667, 0.33333, 0.5, 0.66667, 0.83333, 1.0],
    ),
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(30),
      bottomLeft: Radius.circular(30),
      bottomRight: Radius.circular(30),
    ));
const textFieldDecoration = InputDecoration(
  hintText: 'Enter',
  hintStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      fontFamily: 'Poppins,',
      color: Colors.black),
  contentPadding: EdgeInsets.all(2.0),
  border: OutlineInputBorder(
    borderSide: BorderSide(),
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.transparent),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(30),
    ),
    borderSide: BorderSide(color: Color(0xffcc7384), width: 2.0),
  ),
);

var gradientDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(30.0),
  gradient: SweepGradient(
    center: FractionalOffset.center,
    colors: colorListDefault,
    stops: <double>[0.0, 0.16667, 0.33333, 0.5, 0.66667, 0.83333, 1.0],
  ),
);
const kSendButtonTextStyle = TextStyle(
  color: Color(0xffcc7384),
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Color(0xffcc7384), width: 2.0),
  ),
);
