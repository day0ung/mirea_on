import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../widgets/lottery/algorithm_raffle.dart';
import '../widgets/lottery/basic_raffle.dart';
import '../widgets/lottery/colors_raffle.dart';
import '../widgets/lottery/sniffling_raffle.dart';


class LotteryPage extends StatefulWidget {
  const LotteryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LotteryPageState();
}

class _LotteryPageState extends State<LotteryPage> {
  static final List<Widget> _widgetOptions = <Widget>[
    BasicWidget(),
    SnifflingWidget(),
    ColorsWidget(),
    AlgorithmWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Icon(
            Icons.generating_tokens,
            color: ColorUtils.mainColor,
            size: 40,
          ),
        ),
        actions: const [
          SizedBox(width: 30, height: 30),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: _widgetOptions.length,
          separatorBuilder: (BuildContext context, int index) =>
              SizedBox(height: 10),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => _widgetOptions[index]),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: ExcludeSemantics(
                    child: CircleAvatar(child: Text('d')),
                  ),
                  title: Text("Title"),
                  subtitle: Text("Subtitle"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}