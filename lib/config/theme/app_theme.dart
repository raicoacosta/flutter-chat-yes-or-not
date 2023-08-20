import 'package:flutter/material.dart';

const Color _customColor = Color(0xFFC3BECA);

const List<Color> _colorTheme = [
  _customColor,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.teal,
];

class AppTheme {
  final int selectedColor;
  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < _colorTheme.length,
            'Color must be between 0 and ${_colorTheme.length - 1} ');
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorTheme[selectedColor],
      // Dark Mode
      // brightness: Brightness.dark,
    );
  }
}
