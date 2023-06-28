
import 'package:flutter/material.dart';

import 'colors.dart';

class DecorationUtils {

  static BoxDecoration buildCustomCardDecoration({Color color = Colors.white}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(4),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 3),
        ),
      ],
    );
  }

  static BoxDecoration buildCustomBoxDecoration({
    bool isSelected = false,
    Color color = Colors.white,
    required int number,
  }) {
    return BoxDecoration(
      color: isSelected ? color : Colors.white,
      border: Border.all(color: color),
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: ColorUtils.getColorForNumber(number),
          blurRadius: 2,
        ),
      ],
    );
  }

  static BoxDecoration buildCustomNumberDecoration({
    bool isSelected = false,
    Color color = Colors.white,
    required int number,
  }) {
    return BoxDecoration(
      color: isSelected ? color : Colors.white,
      border: Border.all(color: color),
      borderRadius:  BorderRadius.circular(0),
      boxShadow: [
        BoxShadow(
          color: ColorUtils.getColorForNumber(number),
          blurRadius: 2,
        ),
      ],
    );
  }

  static BoxDecoration buildCustomBoxDecorationRaffle({
    bool isSelected = false,
    Color color = Colors.white,
    required int number,
  }) {
    return BoxDecoration(
      color: isSelected ? color : Colors.white,
      border: Border.all(color: color),
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: ColorUtils.getColorForNumber(number),
          blurRadius: 2,
        ),
      ],
    );
  }

}