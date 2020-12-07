import 'package:flutter/material.dart';
import 'package:sharedpreferences/src/shared/user_preferences.dart';

import 'package:sharedpreferences/src/widgets/nav_widget.dart';

class HomePage extends StatelessWidget {
  
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {

    final prefs = UserPreferences();

    return Scaffold(
      appBar: AppBar(
        title:Text('Shared Preferences'),
        backgroundColor: (prefs.color) ? Colors.red:Colors.green,
      ),
      drawer: NavWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(prefs.name),
          Divider(),
          Text(prefs.sexo == 1 ? 'masculino':'femenino'),
          Divider(),
          Text(prefs.color ? 'rojo':'verde'),
          Divider(),
        ],
      ),
    );
  }

}