// import 'package:flutter/cupertino.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class CardList extends ChangeNotifier {
//   List<String> cards = [];
//
//   Future<void> addCard(String cardText) async {
//     cards.add(cardText);
//     notifyListeners();
//     await _saveCards();
//   }
//
//   Future<void> loadCards() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     cards = prefs.getStringList('cards') ?? [];
//     notifyListeners();
//   }
//
//   Future<void> _saveCards() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setStringList('cards', cards);
//   }
// }