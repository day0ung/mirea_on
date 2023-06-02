
import 'package:flutter/material.dart';

class CardDecoration extends BoxDecoration {
  final Color color;

  CardDecoration({this.color = Colors.white})
      : super(
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