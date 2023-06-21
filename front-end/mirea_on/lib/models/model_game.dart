
class Game {
  final String name;
  bool isSelected;
  List<int> numbers;

  Game(this.name, this.isSelected , {List<int>? numbers}) : numbers = numbers ?? [];
}