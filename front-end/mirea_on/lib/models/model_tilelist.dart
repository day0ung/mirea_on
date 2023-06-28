import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/analyze/color_analyze.dart';
import '../widgets/analyze/history_analyze.dart';
import '../widgets/analyze/number_analyze.dart';
import '../widgets/analyze/snliffling_analyze.dart';
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

class Analyzetiles{

  static final List<WidgetTile> _analyzeTiles = [
    WidgetTile(HistoryAnalyzeWidget(), Icons.history_outlined, '당첨이력', '모든 회차의 당첨이력 확인'),
    WidgetTile(SnlifflingAnalyzeWidget(), Icons.science_outlined, '홀짝통계', '회차별로 홀짝 비율 및 번호합 확인'),
    WidgetTile(ColorAnalyzeWidget(), Icons.format_color_fill, '색상통계', '회차별로 당첨번호 색상 확인'),
    WidgetTile(NumberAnalyzeWidget(), Icons.numbers, '번호통계', '기간별로 당첨번호 출현횟수, 빈도수 확인'),
  ];

  static List<WidgetTile> get analyzeTiles => _analyzeTiles;

}