import 'package:flutter/material.dart';
import 'package:mirea_on/screens/app_splash.dart';

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
      home: SplashPage(),
    );
  }
}


