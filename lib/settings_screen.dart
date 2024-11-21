import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final Function(bool) toggleTheme;
  final bool isDarkMode;

  SettingsScreen({required this.toggleTheme, required this.isDarkMode});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();

}

class _SettingsScreenState extends State<SettingsScreen>{
  late bool _isDarkMode;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.isDarkMode;  // Inicializa el valor del Switch con el valor actual del tema
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opciones'),
        centerTitle: true,
      ),
      body: Center(
        child: SwitchListTile(
          title: Text('Modo Oscuro'),
          value: _isDarkMode,
          onChanged: (bool value) {
            setState(() {
              _isDarkMode = value;
            });
            widget.toggleTheme(value);  //Llama a la función que cambia el tema globalmente
          },
          secondary: const Icon(Icons.lightbulb_outline),
        ),
      ),
    );
  }
}