import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  final int number;
  final bool isFilled;
  final Color mainColor;
  final VoidCallback onPressed;

  const NumberButton({
    Key? key,
    required this.number,
    this.isFilled = true,
    required this.mainColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isFilled ? onPressed : null,
      child: isFilled
          ? Text(
        '$number',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          color: mainColor,
        ),
      )
          : Container(
        color: Colors.white, // 컨테이너 배경색
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.0),
          side: BorderSide(
            color: mainColor,
            width: 2.0,
          ),
        ),
        padding: const EdgeInsets.all(6.0),
        backgroundColor: isFilled ? Colors.white : Colors.white,
      ),
    );
  }
}