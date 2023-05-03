import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //debug모드시 나오는 띠 제거
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }

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
