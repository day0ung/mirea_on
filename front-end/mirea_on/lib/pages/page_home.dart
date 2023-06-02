import 'package:flutter/material.dart';
import '../utils/decoration.dart';


class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget>  createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<String> cards = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      // margin: const EdgeInsets.only(left: 3, right: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: CardDecoration(),
            height: 160,
            child: Row(
              children: [
                Text('첫째줄 텍스트'),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: GridView.count(
                childAspectRatio: 0.7, // 너비:높이 비율 조절
                mainAxisSpacing: 15, // 아이템 간의 수직 간격
                crossAxisSpacing: 12, // 아이템 간의 수평 간격
                crossAxisCount: 2,
                children: [
                  ...cards.map((card) => CardItem(text: card)).toList(),
                  CardButton(onPressed: addCard),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void addCard() {
    setState(() {
      cards.add('New Card');
    });
  }
}

class CardItem extends StatelessWidget {
  final String text;

  const CardItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CardDecoration(color: Colors.deepOrange.shade50),
      child: Center(
        child: Text(text),
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CardButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: CardDecoration(),
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}