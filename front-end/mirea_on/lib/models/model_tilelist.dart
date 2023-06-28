import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/lottery/algorithm_raffle.dart';
import '../widgets/lottery/basic_raffle.dart';
import '../widgets/lottery/colors_raffle.dart';
import '../widgets/lottery/sniffling_raffle.dart';

class WidgetTile {
  final Widget widget;
  final IconData icon;
  final String title;
  final String subTitle;

  WidgetTile(this.widget, this.icon, this.title, this.subTitle);
}

class RaffleTiles {
  static final List<WidgetTile> _raffleTiles = [
    WidgetTile(BasicWidget(), Icons.emoji_events, '기본뽑기', '고정수를 이용하여 번호 생성'),
    WidgetTile(SnifflingWidget(), Icons.hourglass_bottom_sharp, '홀짝뽑기', '홀수 짝수의 비율을 선택하여 번호 생성'),
    WidgetTile(ColorsWidget(), Icons.palette, '색상뽑기', '숫자 색상의 비율을 선택하여 번호생성'),
    WidgetTile(AlgorithmWidget(), Icons.calculate, 'AI뽑기', '알고리즘으로 추천해주는 번호생성'),
  ];

  static List<WidgetTile> get raffleTiles => _raffleTiles;
}