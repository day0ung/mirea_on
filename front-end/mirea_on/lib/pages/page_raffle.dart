import 'package:flutter/material.dart';
import '../utils/colors.dart';
import '../models/model_numbers.dart';

class AppMountListView extends StatelessWidget {
  const AppMountListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height:  (MediaQuery.of(context).size.height * 0.5) - 16.0,
      child: GridView.count(
        crossAxisCount: 7, // 열의 개수
        padding: const EdgeInsets.all(16.0), // 전체 패딩
        mainAxisSpacing: 8.0, // 수직 간격
        crossAxisSpacing: 8.0, // 수평 간격
        children: List.generate( 49,
            (index) => NumberButton(
          number: index + 1,
          isFilled: index < 45,
          mainColor: mainColor,
          onPressed: () {
            // 버튼 클릭 시 동작
          },
        ),
      ),
      )
    );
  }

}
