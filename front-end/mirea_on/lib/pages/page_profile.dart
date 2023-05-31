import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget>  createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage>{

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