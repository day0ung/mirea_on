import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HistoryAnalyzeWidget extends StatefulWidget {
  @override
  _HistoryAnalyzeWidget createState() => _HistoryAnalyzeWidget();
}

class _HistoryAnalyzeWidget extends State<HistoryAnalyzeWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('당첨이력'),
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