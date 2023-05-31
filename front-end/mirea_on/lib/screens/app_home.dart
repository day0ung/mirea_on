import 'package:flutter/material.dart';
import 'package:mirea_on/screens/app_bottom_bar.dart';
import 'package:mirea_on/utils/colors.dart';

import 'app_header.dart';
import '../pages/page_raffle.dart';
import '../not/app_search.dart';
import 'app_menu_list.dart';

class MountsApp extends StatelessWidget {
  const MountsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Icon(
            Icons.terrain,
            color: mainColor,
            size: 40,
          ),
        ),
        actions: const [
          SizedBox(width: 30, height: 30),
        ],
        iconTheme: const IconThemeData(color: mainColor),
      ),
      drawer: Drawer(
        child: Container(
          padding: const EdgeInsets.all(30),
          color: mainColor,
          alignment: Alignment.bottomLeft,
          child: const Icon(
            Icons.terrain,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              AppHeader(),
              // AppSearch(),
              // Expanded(
              //   child: AppNumberListView(),
              // ),
              // AppCategoryList(),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: AppBottomBar(),
          ),
        ],
      )

    );
  }
}
