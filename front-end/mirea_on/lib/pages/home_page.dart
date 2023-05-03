import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView.count(
        crossAxisCount: 9,
        children: List.generate(45, (index) {
          return Center(
            child: ElevatedButton(
              child: Text('Button ${index + 1}'),
              onPressed: () {
                // 버튼이 클릭되었을 때의 동작
              },
            ),
          );
        }),
      ),
    );
  }
}