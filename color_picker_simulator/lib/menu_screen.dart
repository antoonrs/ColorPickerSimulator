import 'dart:io';

import 'package:color_picker_simulator/settings_screen.dart';
import 'package:color_picker_simulator/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuScreen extends StatelessWidget {
  final Function(bool) toggleTheme;
  final bool isDarkMode;

  MenuScreen({required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) => Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/bg.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black12,
            Colors.black87,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        //appBar: AppBar(title: Text('Menú Principal')),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/main-title.png'),
                  width: 400,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                //Text(
                //  'Menú Principal',
                //  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                //),
                SizedBox(height: 20), //Espacio entre el texto y los botones
                Container(
                  width: 400,
                  alignment: Alignment.center,
                  child: Text(
                    "Created by Alberto Alegre, Rodrigo Dueñas, Manuel Gutiérrez, Sancho Quesada, Antón Rodríguez & Miguel Rico",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    softWrap: true,

                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/game');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10), // Para eliminar el padding
                  ),
                  label: Text("Play"),
                  icon: Icon(
                      Icons.videogame_asset_rounded,
                      color: Colors.red
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/store');
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10), // Para eliminar el padding
                  ),
                  label: Text("Shop"),
                  icon: Icon(
                    Icons.shop,
                    color: Colors.green
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsScreen(toggleTheme: toggleTheme, isDarkMode: isDarkMode)
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10), // Para eliminar el padding
                  ),
                  label: Text("Settings"),
                  icon: Icon(
                      Icons.settings,
                      color: Colors.blue
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    if(Platform.isAndroid) {
                      SystemNavigator.pop();
                    } else {
                      exit(0);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(10),
                  ),
                  label: Text("Exit"),
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.purple,
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
