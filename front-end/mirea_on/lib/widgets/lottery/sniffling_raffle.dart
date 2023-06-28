import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/model_game.dart';
import '../../utils/colors.dart';
import '../../utils/decoration.dart';
import '../../utils/shared_preferences_manager.dart';
import '../widget_choose_box.dart';
import '../widget_number.dart';


class SnifflingWidget extends StatefulWidget {
  @override
  _SnifflingWidget createState() => _SnifflingWidget();
}

class _SnifflingWidget extends State<SnifflingWidget> {
  List<Game> games = [ Game('A', true), Game('B', false), Game('C', false), Game('D', false), Game('E', false)];
  List<String> selectedGameNames = [];
  List<int> selectedNumbers = [];

  bool numbersAssigned = false;

  late SharedPreferencesManager _sharedPreferencesManager;


  @override
  void initState() {
    super.initState();
    SharedPreferencesManager.getInstance().then((instance) {
      setState(() {
        _sharedPreferencesManager = instance;
      });
    });
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
                child: ChooseBoxesColumn(
                  boxWidth: boxWidth,
                  games: games,
                  onBoxTap: (index) {
                    setState(() {
                      //A게임은 무조건 선택되도록
                      games[index].isSelected = index == 0 ? true : !games[index].isSelected;
                      updateSelectedGameText();
                    });
                  },
                )
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
                    child: numbersAssigned
                        ? buildAssignedNumbersColumn()
                        : buildSelectNumbersColumn(),
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
      print(game.numbers);
    });
    numbersAssigned = true;
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

  Widget buildAssignedNumbersColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '선택한 번호',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      assignNumbers();
                    },
                    child: Text('다시 뽑기'),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: selectedGameNames.length,
            itemBuilder: (context, index) {
              String gameName = selectedGameNames[index];
              List<int> gameNumbers =
                  games.firstWhere((game) => game.name == gameName).numbers;
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      gameName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: gameNumbers.map((number) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 2),
                          width: 23,
                          height: 23,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorUtils.getColorForNumber(number),
                          ),
                          child: Center(
                            child: Text(
                              number.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }


  Widget buildSelectNumbersColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    selectedGameNames.join(", ") + ' 게임',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
        Expanded(
          child: NumberGridView(
            numbers: selectedNumbers,
            onSelectNumber: (int number) {
              setState(() {
                if (selectedNumbers.contains(number)) {
                  selectedNumbers.remove(number);
                } else if (selectedNumbers.length < 6) {
                  selectedNumbers.add(number);
                }
              });
            },
          ),
        ),
      ],
    );
  }


}




