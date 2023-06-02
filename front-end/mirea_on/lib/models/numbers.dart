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
      body: ListView.builder(
        itemCount: 45, // 번호의 개수를 45로 조정
        itemBuilder: (context, index) {
          final number = index + 1;
          final isSelected = selectedNumbers.contains(number);
          return ListTile(
            title: Text('Number $number'),
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedNumbers.remove(number);
                } else {
                  if (selectedNumbers.length < 6) { // 선택 개수가 6개 미만일 때만 추가
                    selectedNumbers.add(number);
                  }
                }
              });
            },
            tileColor: isSelected ? Colors.blue : null,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, selectedNumbers); // 선택한 번호들을 배열로 전달하고 이전 페이지로 이동
        },
        child: Icon(Icons.check),
      ),
    );
  }
}