import 'package:flutter/material.dart';

class ThemeViewModel with ChangeNotifier {
  double _dx = 0;
  double get dx => _dx;

  double _dy = 0;
  double get dy => _dy;

  Future<void> updateCursorPosition(Offset newPos) async {
    await Future.delayed(const Duration(milliseconds: 50));
    _dx = newPos.dx;
    _dy = newPos.dy;
    notifyListeners();
  }

  int _indexJobExperince = 0;
  int get indexJobExperince => _indexJobExperince;

  void setIndexJobExperience(int index) {
    _indexJobExperince = index;
    notifyListeners();
  }

  int _indexProject = 0;
  int get indexProject => _indexProject;

  void setIndexProject(int index) {
    _indexProject = index;
    notifyListeners();
  }

  int _indexAchievement = 0;
  int get indexAchievement => _indexAchievement;

  void setIndexAchievement(int index) {
    _indexAchievement = index;
    notifyListeners();
  }

  Brightness _isDark = Brightness.dark;
  Brightness get isDark => _isDark;

  int _colorState = 0;
  int get colorState => _colorState;

  Color _mainColor = Colors.amber;
  Color get mainColor => _mainColor;

  void switchMode() {
    _isDark = (_isDark == Brightness.dark) ? Brightness.light : Brightness.dark;
    notifyListeners();
  }

  void switchColor() {
    List<Color> colors = [
      Colors.amber,
      Colors.purple,
      Colors.green,
      Colors.red,
      Colors.blue,
    ];

    _colorState = (colorState >= 4) ? 0 : colorState + 1;
    _mainColor = colors.elementAt(colorState);
    notifyListeners();
  }
  

 double _currentViewPort = 0;
 double get currentViewPort => _currentViewPort;

  void setCurrentViewPort(double width){
    _currentViewPort = width;
    notifyListeners();
  }
}

