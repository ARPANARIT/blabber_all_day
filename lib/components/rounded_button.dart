import 'package:flutter/material.dart';

import '../constants.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton(
      {required this.buttonLabel,
      required this.colorList,
      required this.onPress});

  final String buttonLabel;
  final List<Color> colorList;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: SweepGradient(
            center: FractionalOffset.center,
            colors: colorList,
            stops: <double>[0.0, 0.16667, 0.33333, 0.5, 0.66667, 0.83333, 1.0],
          ),
        ),
        child: MaterialButton(
          elevation: 5.0,
          onPressed: onPress,
          child: Text(
            buttonLabel,
            style: buttonlabels,
          ),
        ),
      ),
    );
  }
}
