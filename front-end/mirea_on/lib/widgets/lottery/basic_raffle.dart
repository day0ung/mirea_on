import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';


class BasicWidget extends StatefulWidget {
  @override
  _BasicWidget createState() => _BasicWidget();
}

class _BasicWidget extends State<BasicWidget> {
  List<int> selectedNumbers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Numbers'),
      ),
      body: GridView.count(
        crossAxisCount: 7,
        children: List.generate(45, (index) {
          final number = index + 1;
          final isSelected = selectedNumbers.contains(number);
          final color = ColorUtils.getColorForNumber(number);
          final textColor = isSelected ? Colors.white : color;

          return GestureDetector(
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedNumbers.remove(number);
                } else {
                  if (selectedNumbers.length < 6) {
                    selectedNumbers.add(number);
                  }
                }
              });
            },
            child: Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: isSelected ? color : Colors.white,
                border: Border.all(color: color),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: ColorUtils.getColorForNumber(number),
                    // spreadRadius: 1,
                    blurRadius: 2,
                    // offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  '$number',
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          List<int> resultNumbers = selectedNumbers.toList();
          while (resultNumbers.length < 6) {
            int randomNumber = Random().nextInt(45) + 1;
            if (!resultNumbers.contains(randomNumber)) {
              resultNumbers.add(randomNumber);
            }
          }
          resultNumbers.sort();
          Navigator.pop(context, resultNumbers);
        },
        child: Icon(Icons.check),
      ),
    );
  }
}