import 'package:flutter/material.dart';


class AppNumberListView extends StatelessWidget {
  const AppNumberListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height:  (MediaQuery.of(context).size.height * 0.5) - 16.0,
    );
  }

}
