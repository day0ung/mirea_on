import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/model_game.dart';

class ChooseBoxesColumn extends StatelessWidget {
  final double boxWidth;
  final List<Game> games;
  final Function(int) onBoxTap;

  const ChooseBoxesColumn({
    required this.boxWidth,
    required this.games,
    required this.onBoxTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Choose Boxes',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(games.length, (index) {
            return BoxWidget(
              width: boxWidth,
              isSelected: games[index].isSelected,
              onTap: () {
                onBoxTap(index);
              },
              text: games[index].name,
            );
          }),
        ),
      ],
    );
  }
}

class BoxWidget extends StatelessWidget {
  final double width;
  final bool isSelected;
  final VoidCallback onTap;
  final String text;

  BoxWidget({
    required this.width,
    required this.isSelected,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        width: width,
        height: 120,
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.redAccent : Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                height: 15,
                padding: const EdgeInsets.only(bottom: 1),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? Colors.white : Colors.redAccent,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.redAccent,
                        fontSize: 14,
                        height: 1.1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '1000원',
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.redAccent,
                        height: 1.1,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 34),

              isSelected
                  ? Icon(
                Icons.check,
                color: Colors.white,
              )
                  : Icon(
                Icons.add,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}






