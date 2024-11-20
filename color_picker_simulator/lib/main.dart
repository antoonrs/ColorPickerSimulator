import 'package:flutter/material.dart';
import 'menu_screen.dart';
import 'game_screen.dart';
import 'result_screen.dart';
import 'store_screen.dart';

void main() {
  runApp(ColorPickerSimulator());
}

class ColorPickerSimulator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Picker Simulator',
      initialRoute: '/',
      routes: {
        '/': (context) => MenuScreen(),
        '/game': (context) => GameScreen(),
        '/result': (context) => ResultScreen(),
        '/store': (context) => StoreScreen(),
      },
    );
  }
}