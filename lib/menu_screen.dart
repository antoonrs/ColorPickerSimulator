import 'package:color_picker_simulator/settings_screen.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  final Function(bool) toggleTheme;
  final bool isDarkMode;

  MenuScreen({required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Menú Principal')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Menú Principal',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20), //Espacio entre el texto y los botones
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/game');
              },
              child: Text('Jugar'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/store');
              },
              child: Text('Tienda'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(toggleTheme: toggleTheme, isDarkMode: isDarkMode)
                  ),
                );
              },
              child: Text('Opciones'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Salir'),
            ),
          ],
        ),
      ),
    );
  }
}
