import 'package:flutter/material.dart';
import 'result_screen.dart';

class StoreScreen extends StatefulWidget {
  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  void _buyPowerUp(String color) {
    if (ResultScreen.totalPoints >= 100) {
      setState(() {
        ResultScreen.totalPoints -= 100;
        ResultScreen.powerUps[color] = (ResultScreen.powerUps[color] ?? 0) + 1;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('¡Potenciador de $color comprado!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No tienes suficientes puntos')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tienda',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Puntos: ${ResultScreen.totalPoints}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          centerTitle: true,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Compra potenciadores (100 puntos cada uno)', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            _buildPowerUpButton('Rojo', 'red'),
            SizedBox(height: 20),
            _buildPowerUpButton('Verde', 'green'),
            SizedBox(height: 20),
            _buildPowerUpButton('Azul', 'blue'),
            SizedBox(height: 20),
            Text(
              'Potenciadores disponibles:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Rojo: ${ResultScreen.powerUps['red']}'),
            Text('Verde: ${ResultScreen.powerUps['green']}'),
            Text('Azul: ${ResultScreen.powerUps['blue']}'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Volver al menú'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPowerUpButton(String label, String color) {
    return ElevatedButton(
      onPressed: () => _buyPowerUp(color),
      child: Text('Comprar potenciador $label'),
    );
  }
}
