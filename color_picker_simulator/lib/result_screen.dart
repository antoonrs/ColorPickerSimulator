import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  static int totalPoints = 0;

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    final target = arguments['target'] as List<int>;
    final guess = arguments['guess'] as List<int>;

    final difference = [
      (target[0] - guess[0]).abs(),
      (target[1] - guess[1]).abs(),
      (target[2] - guess[2]).abs(),
    ];

    final totalDifference = difference.reduce((a, b) => a + b);
    int pointsEarned = (100 - totalDifference).clamp(0, 100);
    totalPoints += pointsEarned;

    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
        automaticallyImplyLeading: false, // Elimina la flecha de retorno
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Puntos: $totalPoints',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color verdadero: RGB(${target[0]}, ${target[1]}, ${target[2]})'),
          SizedBox(height: 10),
          Text('Tu respuesta: RGB(${guess[0]}, ${guess[1]}, ${guess[2]})'),
          SizedBox(height: 10),
          Text('Diferencia total: $totalDifference puntos'),
          SizedBox(height: 10),
          Text('Puntos obtenidos: $pointsEarned'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/game');
            },
            child: Text('Volver a jugar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/store');
            },
            child: Text('Ir a la Tienda'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            child: Text('Volver al Menú'),
          ),
        ],
      ),
    );
  }
}
