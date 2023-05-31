import 'package:flutter/material.dart';

class LotteryPage extends StatefulWidget{
  const LotteryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget>  createState() => _LotteryPage();
}

class _LotteryPage extends State<LotteryPage>{

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.blue, // 블루로 설정
      ),
      child: Row(
        children: [
          const SizedBox( height: 150),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '프로필 페이지',
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