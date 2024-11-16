import 'package:flutter/material.dart';
import 'dart:math';
import 'result_screen.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final _rController = TextEditingController();
  final _gController = TextEditingController();
  final _bController = TextEditingController();

  late int _targetR, _targetG, _targetB;
  int _attemptsLeft = 3; // Intentos restantes
  String _redHint = ''; // Pista para el rojo
  String _greenHint = ''; // Pista para el verde
  String _blueHint = ''; // Pista para el azul

  @override
  void initState() {
    super.initState();
    _generateRandomColor();
  }

  void _generateRandomColor() {
    final random = Random();
    _targetR = random.nextInt(256);
    _targetG = random.nextInt(256);
    _targetB = random.nextInt(256);
  }

  void _useHint(String color) {
    setState(() {
      if (ResultScreen.powerUps[color]! > 0) {
        ResultScreen.powerUps[color] = ResultScreen.powerUps[color]! - 1;
        if (color == 'red') _rController.text = _targetR.toString();
        if (color == 'green') _gController.text = _targetG.toString();
        if (color == 'blue') _bController.text = _targetB.toString();
      }
    });
  }

  void _submitGuess() {
    final guessR = int.tryParse(_rController.text) ?? 0;
    final guessG = int.tryParse(_gController.text) ?? 0;
    final guessB = int.tryParse(_bController.text) ?? 0;

    if (_attemptsLeft > 1) {
      setState(() {
        _redHint = _generateHint('Rojo', guessR, _targetR);
        _greenHint = _generateHint('Verde', guessG, _targetG);
        _blueHint = _generateHint('Azul', guessB, _targetB);
        _attemptsLeft--;
      });
    } else {
      Navigator.pushNamed(
        context,
        '/result',
        arguments: {
          'target': [_targetR, _targetG, _targetB],
          'guess': [guessR, guessG, guessB],
        },
      );
    }
  }

  String _generateHint(String color, int guess, int target) {
    if (guess < target) {
      return 'El $color debe ser más alto';
    } else if (guess > target) {
      return 'El $color debe ser más bajo';
    } else {
      return 'El $color es correcto';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adivina el Color'),
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
          Container(
            height: 100,
            width: 100,
            color: Color.fromARGB(255, _targetR, _targetG, _targetB),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Adivina el color en coordenadas RGB:'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  if (ResultScreen.powerUps['red']! > 0)
                    ElevatedButton(
                      onPressed: () => _useHint('red'),
                      child: Text('Potenciador R'),
                    ),
                  _buildInputField(_rController, 'R'),
                ],
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  if (ResultScreen.powerUps['green']! > 0)
                    ElevatedButton(
                      onPressed: () => _useHint('green'),
                      child: Text('Potenciador G'),
                    ),
                  _buildInputField(_gController, 'G'),
                ],
              ),
              SizedBox(width: 10),
              Column(
                children: [
                  if (ResultScreen.powerUps['blue']! > 0)
                    ElevatedButton(
                      onPressed: () => _useHint('blue'),
                      child: Text('Potenciador B'),
                    ),
                  _buildInputField(_bController, 'B'),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submitGuess,
            child: Text('Aceptar'),
          ),
          SizedBox(height: 10),
          Text('Intentos restantes: $_attemptsLeft'),
          if (_redHint.isNotEmpty || _greenHint.isNotEmpty || _blueHint.isNotEmpty)
            Column(
              children: [
                if (_redHint.isNotEmpty) Text('Pista Rojo: $_redHint', style: TextStyle(color: Colors.red)),
                if (_greenHint.isNotEmpty) Text('Pista Verde: $_greenHint', style: TextStyle(color: Colors.green)),
                if (_blueHint.isNotEmpty) Text('Pista Azul: $_blueHint', style: TextStyle(color: Colors.blue)),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String label) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }
}
