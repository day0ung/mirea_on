import 'package:flutter/material.dart';

class ColorUtils{
  static const mainColor = Color(0xFFFF5656);

  static Color getColorForNumber(int number) {
    if (number >= 1 && number <= 10) {
      return Colors.orangeAccent;
    } else if (number >= 11 && number <= 20) {
      return Colors.lightBlueAccent;
    } else if (number >= 21 && number <= 30) {
      return Colors.redAccent;
    } else if (number >= 31 && number <= 40) {
      return Colors.black45;
    } else {
      return Colors.lightGreen;
    }
  }

}



