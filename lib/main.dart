import 'package:color_picker_simulator/settings_screen.dart';
import 'package:flutter/material.dart';
import 'menu_screen.dart';
import 'game_screen.dart';
import 'result_screen.dart';
import 'store_screen.dart';
import 'settings_screen.dart';


void main() {
  runApp(ColorPickerSimulator());
}

class ColorPickerSimulator extends StatefulWidget {
  @override
  _ColorPickerSimulator createState() => _ColorPickerSimulator();
}

class _ColorPickerSimulator extends State<ColorPickerSimulator> {
  bool _isDarkMode = false; //Estado para el tema
  // Cambia el tema
  void _toggleTheme(bool value) {
    setState(() {
      _isDarkMode = value;
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Picker Simulator',
      theme: _isDarkMode
        ? _buildDarkTheme()  //Tema oscuro
        : _buildLightTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => MenuScreen(toggleTheme: _toggleTheme, isDarkMode: _isDarkMode),
        '/game': (context) => GameScreen(),
        '/result': (context) => ResultScreen(),
        '/store': (context) => StoreScreen(),
        '/settings': (context) => SettingsScreen(toggleTheme: _toggleTheme, isDarkMode: _isDarkMode)
      },
    );
  }

  //Tema claro personalizado
  ThemeData _buildLightTheme(){
    return ThemeData.light().copyWith(
      primaryColor: Colors.blue,  //Color primario
      colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: Colors.orange),
      scaffoldBackgroundColor: Colors.blue.shade100,
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.black),  //Texto general
        bodyMedium: TextStyle(color: Colors.black),
        bodySmall: TextStyle(color: Colors.black),
        headlineLarge: TextStyle(color: Colors.blue), //Títulos
        headlineMedium: TextStyle(color: Colors.blue),
        headlineSmall: TextStyle(color: Colors.blue),
      ),
      appBarTheme: AppBarTheme(
        color: Colors.blue, //Color de la barra appBar
        titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        iconTheme: IconThemeData(color: Colors.white), //Iconos en la appBar
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.blue.shade50,
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(Colors.blue),
        trackColor: MaterialStateProperty.all(Colors.blue.shade50),
      ),
      listTileTheme: ListTileThemeData(
        textColor: Colors.black,
      ),
    );
  }

  //Tema oscuro personalizado
  ThemeData _buildDarkTheme(){
    return ThemeData.dark().copyWith(
      primaryColor: Colors.deepPurple,  //Color primario
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: Colors.greenAccent),
      scaffoldBackgroundColor: Colors.grey.shade900,
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: Colors.deepPurple.shade50),  //Texto general
        bodyMedium: TextStyle(color: Colors.deepPurple.shade50),
        bodySmall: TextStyle(color: Colors.deepPurple.shade50),
        headlineLarge: TextStyle(color: Colors.blueGrey), //Títulos
        headlineMedium: TextStyle(color: Colors.blueGrey),
        headlineSmall: TextStyle(color: Colors.blueGrey),
      ),
      appBarTheme: AppBarTheme(
        color: Colors.deepPurple.shade700, //Color de la barra appBar
        titleTextStyle: TextStyle(color: Colors.deepPurple.shade50, fontWeight: FontWeight.bold, fontSize: 20),
        iconTheme: IconThemeData(color: Colors.white), //Iconos en la appBar
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.deepPurple.shade50,
          backgroundColor: Colors.deepPurple,
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(Colors.deepPurple),
        trackColor: MaterialStateProperty.all(Colors.deepPurple.shade50),
      ),
      listTileTheme: ListTileThemeData(
        textColor: Colors.deepPurple.shade50,
      ),
    );
  }
}