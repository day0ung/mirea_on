import 'package:flutter/material.dart';


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
      padding: const EdgeInsets.only(left: 5, right: 5),
      // margin: const EdgeInsets.only(left: 5, right: 5),
      color: Colors.blue,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            height: 130,
            child: Row(
              children: [
                Text('첫째줄 텍스트'),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 15),
              color: Colors.green,
              child: GridView.count(
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
      margin: const EdgeInsets.all(8),
      color: Colors.white,
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
      margin: const EdgeInsets.all(8),
      color: Colors.white,
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}