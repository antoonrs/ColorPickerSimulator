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
        SnackBar(content: Text('¡$color clue purchased!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('You don´t have enough points')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Shop',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Points: ${ResultScreen.totalPoints}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          centerTitle: true,
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Buy a clue',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )
            ),
            SizedBox(height: 20),
            _buildPowerUpButton('Red', 'red', Colors.red),
            SizedBox(height: 20),
            _buildPowerUpButton('Green', 'green', Colors.green),
            SizedBox(height: 20),
            _buildPowerUpButton('Blue', 'blue', Colors.blue),
            SizedBox(height: 20),
            Text(
              'Available clues:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Red: ${ResultScreen.powerUps['red']}'),
            Text('Green: ${ResultScreen.powerUps['green']}'),
            Text('Blue: ${ResultScreen.powerUps['blue']}'),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPowerUpButton(String label, String colorPurchased, Color color) {
    return ElevatedButton(
      onPressed: () => _buyPowerUp(colorPurchased),
      child: Text('$label clue'),
      style: ElevatedButton.styleFrom(backgroundColor: color),
    );
  }
}
