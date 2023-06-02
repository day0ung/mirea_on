import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberPage extends StatefulWidget {
  @override
  _NumberPageState createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  List<int> selectedNumbers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Numbers'),
      ),
      body: GridView.count(
        crossAxisCount: 7, // 열의 개수를 7로 설정
        children: List.generate(45, (index) {
          final number = index + 1;
          final isSelected = selectedNumbers.contains(number);
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
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : null,
                border: Border.all(),
              ),
              child: Center(
                child: Text('$number'),
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