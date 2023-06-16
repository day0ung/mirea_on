import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AlgorithmWidget extends StatefulWidget {
  @override
  _AlgorithmWidget createState() => _AlgorithmWidget();
}

class _AlgorithmWidget extends State<AlgorithmWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI 뽑기'),
      ),
      body: Center(
        child: Text('AlgorithmWidget Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.check),
      ),
    );
  }
}