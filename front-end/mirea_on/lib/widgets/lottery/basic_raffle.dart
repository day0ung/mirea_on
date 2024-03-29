import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mirea_on/utils/decoration.dart';

import '../../utils/colors.dart';
import '../../utils/shared_preferences_manager.dart';


class BasicWidget extends StatefulWidget {
  @override
  _BasicWidget createState() => _BasicWidget();
}

class _BasicWidget extends State<BasicWidget> {
  List<int> selectedNumbers = [];

  late SharedPreferencesManager _sharedPreferencesManager;

  @override
  void initState() {
    super.initState();
    SharedPreferencesManager.getInstance().then((instance) {
      setState(() {
        _sharedPreferencesManager = instance;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기본 뽑기'),
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
              decoration: DecorationUtils.buildCustomBoxDecoration(
                isSelected: isSelected,
                color: color,
                number: number,
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
        onPressed: () async {
          List<int> resultNumbers = selectedNumbers.toList();
          while (resultNumbers.length < 6) {
            int randomNumber = Random().nextInt(45) + 1;
            if (!resultNumbers.contains(randomNumber)) {
              resultNumbers.add(randomNumber);
            }
          }
          resultNumbers.sort();

          if (_sharedPreferencesManager != null) {
            await _sharedPreferencesManager.addNumbersToGrid(resultNumbers);
          }
          Navigator.pop(context, resultNumbers);
        },
        child: Icon(Icons.check),
      ),
    );
  }
}