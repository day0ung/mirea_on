import 'package:flutter/material.dart';

import '../models/model_tilelist.dart';
import '../utils/colors.dart';


class LotteryPage extends StatefulWidget {
  const LotteryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LotteryPageState();
}

class _LotteryPageState extends State<LotteryPage> {
  static final List<WidgetTile> tileList = RaffleTiles.raffleTiles;

  List<int> selectedNumbers = [];

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
          itemCount: tileList.length,
          separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () async {
                await Navigator.push<List<int>>(
                  context,
                  MaterialPageRoute(builder: (context) => tileList[index].widget),
                );

                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomeApp()),
                // );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: ExcludeSemantics(
                    child:
                    CircleAvatar(child: Icon(tileList[index].icon ,color: Colors.white,), backgroundColor: Colors.orangeAccent,)
                  ),
                  title: Text(tileList[index].title),
                  subtitle: Text(tileList[index].subTitle),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}