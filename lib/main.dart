import 'package:flutter/material.dart';
import 'package:sharedpreferences/src/pages/home_page.dart';
import 'package:sharedpreferences/src/pages/settings_page.dart';
import 'package:sharedpreferences/src/shared/user_preferences.dart';
 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {

  final prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shared Preferences',
      initialRoute: prefs.page,
      routes: {
        HomePage.routeName : (BuildContext context) { prefs.page = HomePage.routeName; return HomePage();},
        SettingsPage.routeName :(BuildContext context) { prefs.page = SettingsPage.routeName; return SettingsPage();},
      },
    );
  }
}