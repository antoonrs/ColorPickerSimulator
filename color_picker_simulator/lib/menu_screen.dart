import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menú Principal')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/game');
              },
              child: Text('Jugar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Cierra la aplicación
              },
              child: Text('Salir'),
            ),
          ],
        ),
      ),
    );
  }
}
