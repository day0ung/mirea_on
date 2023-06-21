import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/decoration.dart';

class NumberGridView extends StatelessWidget {
  final List<int> numbers;
  final ValueSetter<int> onSelectNumber;

  const NumberGridView({
    required this.numbers,
    required this.onSelectNumber,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 7,
      children: List.generate(45, (index) {
        final number = index + 1;
        final isSelected = numbers.contains(number);
        final color = ColorUtils.getColorForNumber(number);
        final textColor = isSelected ? Colors.white : color;

        return GestureDetector(
          onTap: () => onSelectNumber(number),
          child: Container(
            margin: EdgeInsets.all(7),
            padding: EdgeInsets.all(4),
            decoration: DecorationUtils.buildCustomNumberDecoration(
              isSelected: isSelected,
              color: color,
              number: number,
            ),
            child: Center(
              child: Text(
                '$number',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}