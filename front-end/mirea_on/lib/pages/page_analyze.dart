import 'package:flutter/material.dart';

import '../models/model_tilelist.dart';
import '../utils/colors.dart';


class AnalyzePage extends StatefulWidget{
  const AnalyzePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget>  createState() => _AnalyzePage();
}

class _AnalyzePage extends State<AnalyzePage>{
  static final List<WidgetTile> tileList = Analyzetiles.analyzeTiles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Icon(
            Icons.analytics,
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
                      CircleAvatar(child: Icon(tileList[index].icon ,color: Colors.white,), backgroundColor: Colors.lightBlueAccent,)
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