import 'package:flutter/material.dart';
import 'package:mirea_on/pages/page_analyze.dart';
import 'package:mirea_on/pages/page_home.dart';
import 'package:mirea_on/pages/page_lottery.dart';
import 'package:mirea_on/pages/page_profile.dart';
import 'package:mirea_on/utils/colors.dart';


class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();

}

class _HomeAppState extends State<HomeApp>{
  int _selectedIndex = 0;
  final PageController _pageController = PageController(initialPage: 0); //슬라이드시 페이지 전환

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    LotteryPage(),
    AnalyzePage(),
    ProfilePage(),
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
        body: SafeArea(
          child: PageView(
            controller: _pageController,
            children: _widgetOptions,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          margin: const EdgeInsets.only(top: 7),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.shifting, //default fixed,
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            selectedItemColor: mainColor,
            selectedFontSize: 12,
            iconSize: 30,
            unselectedItemColor: Colors.grey,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: '홈'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.generating_tokens_outlined), label: '추첨'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.analytics_outlined), label: '분석'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: '마이'),
            ],

          ),
        )
    );
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 50),
        curve: Curves.easeInOut,
      );
    });
  }
}

