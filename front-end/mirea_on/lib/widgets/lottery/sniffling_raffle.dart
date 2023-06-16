import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SnifflingWidget extends StatefulWidget {
  @override
  _SnifflingWidget createState() => _SnifflingWidget();
}

class _SnifflingWidget extends State<SnifflingWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('홀짝 뽑기'),
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