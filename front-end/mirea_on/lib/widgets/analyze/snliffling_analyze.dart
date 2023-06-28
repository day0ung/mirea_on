import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SnlifflingAnalyzeWidget extends StatefulWidget {
  @override
  _SnlifflingAnalyzeWidget createState() => _SnlifflingAnalyzeWidget();
}

class _SnlifflingAnalyzeWidget extends State<SnlifflingAnalyzeWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('홀짝 통계'),
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