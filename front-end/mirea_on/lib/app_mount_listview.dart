import 'package:flutter/material.dart';
import 'models/mount_model.dart';

class AppMountListView extends StatelessWidget {
  const AppMountListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Row(
      children: [
        SizedBox(width: 100, height: 50),
        Text('Hello World'),
      ],
    );
    return SizedBox(

      height: 150,
      child: GridView.count(
        crossAxisCount: 7, // 열의 개수
        padding: const EdgeInsets.all(16.0), // 전체 패딩
        mainAxisSpacing: 8.0, // 수직 간격
        crossAxisSpacing: 8.0, // 수평 간격
        children: List.generate(45, (index) {
          return ElevatedButton(
            onPressed: () {
              // 버튼 클릭 시 동작
            },
            child: Text(
                '${index + 1}',
                style: TextStyle(
                color: Colors.black, // 텍스트 색상
            ),
            ),

            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1.0), // 버튼의 모서리를 둥글게 처리
                side: BorderSide(
                  color: Colors.redAccent, // 테두리 색상
                  width: 1.0, // 테두리 두께
                ),
              ),
              padding: const EdgeInsets.all(6.0), // 버튼 내부 패딩
              backgroundColor: Colors.white, // 버튼의 배경색
            ),
          );
        }),
      )
    );
  }

}
