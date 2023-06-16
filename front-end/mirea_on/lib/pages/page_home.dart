import 'package:flutter/material.dart';
import 'package:mirea_on/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/decoration.dart';
import '../utils/shared_preferences_manager.dart';
import '../widgets/lottery/basic_raffle.dart';


class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget>  createState() => _HomePage();
}


class _HomePage extends State<HomePage> {
  List<List<int>> grids = [];
  List<int> selectedNumbers = [];
  late SharedPreferencesManager _sharedPreferencesManager;

  @override
  void initState() {
    super.initState();
    SharedPreferencesManager.getInstance().then((instance) {
      setState(() {
        _sharedPreferencesManager = instance;
        grids = _sharedPreferencesManager.grids;
      });
    });
  }

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
            color: ColorUtils.mainColor,
            size: 40,
          ),
        ),
        actions: const [
          SizedBox(width: 30, height: 30),
        ],
        iconTheme: const IconThemeData(color: ColorUtils.mainColor),
      ),
      body: Container(
        padding: const EdgeInsets.all(5),
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
                child: GridView.builder(
                  itemCount: grids.length + 1, // 그리드와 버튼 개수
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    if (index < grids.length) {
                      return CardItem(
                        text: grids[index].toString(),
                        onDelete: () async {
                          await _sharedPreferencesManager.deleteGrid(index);
                          setState(() {
                            grids = _sharedPreferencesManager.grids;
                          });
                        },
                      );
                    } else {
                      return CardButton(
                        onNumbersSelected: (numbers) async {
                          setState(() {
                            grids = _sharedPreferencesManager.grids;
                          });
                        },
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String text;
  final VoidCallback onDelete;
  const CardItem({required this.text, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CardDecoration(color: Colors.deepOrange.shade50),
      child: Stack(
        children: [
          Center(
            child: Text(text),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: IconButton(
              icon: Icon(Icons.delete, color: Colors.grey),
              onPressed: onDelete,
            ),
          ),
        ],
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  final void Function(List<int>)? onNumbersSelected;

  const CardButton({this.onNumbersSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(1),
      decoration: CardDecoration(),
      child: InkWell(
        onTap: () async {
          final selectedNumbers = await Navigator.push<List<int>>(
            context,
            MaterialPageRoute(builder: (context) => BasicWidget()),
          );

          if (selectedNumbers != null && onNumbersSelected != null) {
            onNumbersSelected!(selectedNumbers);
          }
        },
        child: Center(
          child: Icon(Icons.add, color: Colors.grey),
        ),
      ),
    );
  }
}