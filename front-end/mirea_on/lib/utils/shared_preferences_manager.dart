import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static SharedPreferencesManager? _instance;
  late SharedPreferences _prefs;
  List<List<int>> grids = [];

  SharedPreferencesManager._();

  static Future<SharedPreferencesManager> getInstance() async {
    if (_instance == null) {
      _instance = SharedPreferencesManager._();
      await _instance!._init();
    }
    return _instance!;
  }

  Future<void> _init() async {
    _prefs = await SharedPreferences.getInstance();
    grids = await loadGrids(); // 그리드 데이터를 로드하여 멤버 변수에 할당
  }

  Future<List<List<int>>> loadGrids() async {
    final savedGrids = _prefs.getStringList('grids');
    if (savedGrids != null) {
      return savedGrids.map((grid) => grid.split(',').map(int.parse).toList()).toList();
    } else {
      return [];
    }
  }

  Future<void> saveGrids() async {
    final gridStrings = grids.map((grid) => grid.join(',')).toList();
    await _prefs.setStringList('grids', gridStrings);
  }

  Future<void> deleteGrid(int index) async {
    if (index >= 0 && index < grids.length) {
      grids.removeAt(index);
      await saveGrids();
    }
  }

  Future<void> addNumbersToGrid(List<int> numbers) async {
    grids.add(numbers);
    await saveGrids();
  }
}