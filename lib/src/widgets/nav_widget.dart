import 'package:flutter/material.dart';
import 'package:sharedpreferences/src/pages/home_page.dart';
import 'package:sharedpreferences/src/pages/settings_page.dart';

class NavWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) => Drawer(
    child: ListView( 
      padding: EdgeInsets.zero, children:[
        DrawerHeader(
          child: Container(),
          decoration: BoxDecoration(image:DecorationImage(
            image: AssetImage('assets/menu.jpg'),
            fit: BoxFit.cover
          ),),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: () => Navigator.pushReplacementNamed(context, HomePage.routeName),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () => Navigator.pushReplacementNamed(context, SettingsPage.routeName),
        ),
      ],
    ),
  );
}