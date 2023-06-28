import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ColorAnalyzeWidget extends StatefulWidget {
  @override
  _ColorAnalyzeWidget createState() => _ColorAnalyzeWidget();
}

class _ColorAnalyzeWidget extends State<ColorAnalyzeWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('색상별 통계'),
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