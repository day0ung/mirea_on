import 'package:flutter/material.dart';

class AnalyzePage extends StatefulWidget{
  const AnalyzePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget>  createState() => _AnalyzePage();
}

class _AnalyzePage extends State<AnalyzePage>{

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: [
          const SizedBox( height: 150),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '분석 페이지',
                style:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}