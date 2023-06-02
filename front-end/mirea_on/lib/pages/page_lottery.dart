import 'package:flutter/material.dart';

class LotteryPage extends StatefulWidget{
  const LotteryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget>  createState() => _LotteryPage();
}

class _LotteryPage extends State<LotteryPage>{

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
        restorationId: 'list_demo_list_view',

        // EdgeInsets.symmetric(vertical: 8) - 위 아래에 여백으로 8 픽셀을 추가합니다.
        padding: const EdgeInsets.symmetric(vertical: 8),

        children: [

          // 20개의 ListTile 위젯을 자식 위젯으로 추가합니다.
          for (int index = 1; index < 21; index++)

            ListTile(

              // 숫자가 적힌 동그라미를 아이콘 자리에 배치합니다.
                leading: ExcludeSemantics(
                  child: CircleAvatar(child: Text('$index')),
                ),

                title: Text(
                  "Title",
                ),
                subtitle: Text("subtitle")
            ),
        ],
      ),
    );

  }
}