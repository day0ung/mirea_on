import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NumberAnalyzeWidget extends StatefulWidget {
  @override
  _NumberAnalyzeWidget createState() => _NumberAnalyzeWidget();
}

class _NumberAnalyzeWidget extends State<NumberAnalyzeWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('번호별 통계'),
      ),
      body: Center(
        child: Text('_HistoryWidget'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.check),
      ),
    );
  }
}