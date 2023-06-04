import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ColorsWidget extends StatefulWidget {
  @override
  _ColorsWidget createState() => _ColorsWidget();
}

class _ColorsWidget extends State<ColorsWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ColorWidget'),
      ),
      body: Center(
        child: Text('ColorWidget Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.check),
      ),
    );
  }
}