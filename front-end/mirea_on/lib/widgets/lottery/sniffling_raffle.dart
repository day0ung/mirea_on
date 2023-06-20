import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/model_game.dart';
import '../../utils/colors.dart';
import '../../utils/decoration.dart';


class SnifflingWidget extends StatefulWidget {
  @override
  _SnifflingWidget createState() => _SnifflingWidget();
}

class _SnifflingWidget extends State<SnifflingWidget> {
  List<Game> games = [ Game('A', true), Game('B', false), Game('C', false), Game('D', false), Game('E', false)];
  List<String> selectedGameNames = [];
  List<int> selectedNumbers = [];


  @override
  void initState() {
    super.initState();
    updateSelectedGameText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Text(
            '홀짝 뽑기'
        ),

      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double containerWidth = constraints.maxWidth - 10;
          double boxWidth = containerWidth / 5.5;

          return Column(
            children: [
              Container(
                decoration: DecorationUtils.buildCustomCardDecoration(),
                height: 155,
                width: containerWidth,
                child: Column(
                  children: [
                    Text(
                      'Choose Boxes',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(5, (index) {
                        return BoxWidget(
                          width: boxWidth,
                          isSelected: games[index].isSelected,
                          onTap: () {
                            setState(() {
                              games[index].isSelected = !games[index].isSelected;
                              updateSelectedGameText();
                            });
                          },
                          text: '${games[index].name}',
                          numbers: selectedNumbers,
                        );
                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: containerWidth,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 1.0),
                    ),
                    child: Column(
                      mainAxisAlignment: selectedGameNames.isNotEmpty
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.center,
                      crossAxisAlignment: selectedGameNames.isNotEmpty
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                          child: selectedGameNames.isEmpty
                              ? Center(
                                  child: Text(
                                    '게임을 선택해주세요',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,  //Text는 왼, Button: 오
                                      children: [
                                        Text(
                                          selectedGameNames.join(",") +' 게임',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            assignNumbers();

                                          },
                                          child: Text('뽑기'),
                                        ),
                                      ],
                                    ),

                                  ],

                                ),
                        ),
                        if(selectedGameNames.isNotEmpty)
                          Expanded(
                            child: GridView.count(
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
                                          color: textColor, fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),

    );
  }

  void updateSelectedGameText() {
    selectedGameNames = games.where((game) => game.isSelected)
                        .map((game) => game.name)
                        .toList();

  }

  void assignNumbers() {
    games.where((game) => game.isSelected).forEach((game) {
      game.numbers = assignNumbersToGame();
    });

    selectedNumbers.clear();
    setState(() {
      // 화면을 다시 그리기 위해 setState() 호출
    });

  }

  List<int> assignNumbersToGame() {
    List<int> resultNumbers = selectedNumbers.toList();
    while (resultNumbers.length < 6) {
      int randomNumber = Random().nextInt(45) + 1;
      if (!resultNumbers.contains(randomNumber)) {
        resultNumbers.add(randomNumber);
      }
    }
    resultNumbers.sort();
    return resultNumbers;
  }


}

class BoxWidget extends StatelessWidget {
  final double width;
  final bool isSelected;
  final VoidCallback onTap;
  final String text;
  final List<int> numbers;

  BoxWidget({
    required this.width,
    required this.isSelected,
    required this.onTap,
    required this.text,
    required this.numbers
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
