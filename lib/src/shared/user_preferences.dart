
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/src/pages/home_page.dart';

class UserPreferences{

  static final UserPreferences _instance = UserPreferences._internal();
  
  factory UserPreferences(){
    return _instance;
  }
  UserPreferences._internal();
  SharedPreferences _prefs;

  initPrefs() async{
    this._prefs = await SharedPreferences.getInstance();
  }

  //INICIALIZO LOS SHARED PREFERENCES QUE VOY A NECESITAR

  get sexo {
    return _prefs.getInt('sexo') ?? 1;
  }
  set sexo(int value){
    _prefs.setInt('sexo', value);
  }

  get color {
    return _prefs.getBool('color') ?? true;
  }
  set color(bool value){
    _prefs.setBool('color', value);
  }

  get name {
    return _prefs.getString('name') ?? 'gato';
  }
  set name(String value){
    _prefs.setString('name', value);
  }

  get page {
    return _prefs.getString('page') ?? HomePage.routeName;
  }
  set page(String value){
    _prefs.setString('page', value);
  }

}