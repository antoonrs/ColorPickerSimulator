import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  static int totalPoints = 0;
  static bool pointsAssigned = false;
  static Map<String, int> powerUps = {'red': 0, 'green': 0, 'blue': 0};

  @override
  Widget build(BuildContext context) {
    //Obtiene los argumentos y verifica si son nulos
    final Map? arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    if(arguments == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text(
            'No se recibieron argumentos.',
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    }
    //Obtiene los valores de los argumentos
    final target = arguments['target'] as List<int>;
    final guess = arguments['guess'] as List<int>;

    final difference = [
      (target[0] - guess[0]).abs(),
      (target[1] - guess[1]).abs(),
      (target[2] - guess[2]).abs(),
    ];
    final totalDifference = difference.reduce((a, b) => a + b);
    final pointsEarned = (100 - totalDifference).clamp(0, 100);

    if (!pointsAssigned) {
      totalPoints += pointsEarned;
      pointsAssigned = true;
    }

    return Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Resultado',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Puntos: $totalPoints',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text('Color verdadero: RGB(${target[0]}, ${target[1]}, ${target[2]})'),
                SizedBox(width: 10),
                Container(
                    width:40,
                    height:40,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(target[0], target[1], target[2], 1),
                      borderRadius: BorderRadius.circular(8),
                    )

                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Tu respuesta: RGB(${guess[0]}, ${guess[1]}, ${guess[2]})'),
                SizedBox(width:10),
                Container(
                  width: 40,
                  height:40,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(guess[0], guess[1], guess[2], 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Text('Puntos obtenidos: $pointsEarned'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ResultScreen.pointsAssigned = false; // Reinicia el estado para la nueva ronda
                Navigator.pushReplacementNamed(context, '/game');
              },
              child: Text('Volver a jugar'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/store');
              },
              child: Text('Ir a la Tienda'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Volver al Menú'),
            ),
          ],
        ),
      ),
    );
  }
}

