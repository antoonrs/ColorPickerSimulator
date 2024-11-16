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
      appBar: AppBar(
        title: Text('Tienda'),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Puntos: ${ResultScreen.totalPoints}',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Compra potenciadores (100 puntos cada uno)', style: TextStyle(fontSize: 16)),
          SizedBox(height: 20),
          _buildPowerUpButton('Rojo', 'red'),
          _buildPowerUpButton('Verde', 'green'),
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
    );
  }

  Widget _buildPowerUpButton(String label, String color) {
    return ElevatedButton(
      onPressed: () => _buyPowerUp(color),
      child: Text('Comprar potenciador $label'),
    );
  }
}
