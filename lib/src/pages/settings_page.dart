import 'package:flutter/material.dart';
import 'package:sharedpreferences/src/shared/user_preferences.dart';
import 'package:sharedpreferences/src/widgets/nav_widget.dart';

class SettingsPage extends StatefulWidget {
  
  static final String routeName = 'seetings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _color;
  int _sexo;
  String _name;

  TextEditingController textEditingController;
  final prefs = UserPreferences();

  @override
  void initState() {
    textEditingController = TextEditingController(text: _name);
    _sexo = prefs.sexo;
    _name = prefs.name;
    _color = prefs.color;
    //prefs.page = SettingsPage.routeName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Shared Preferences'),backgroundColor: (prefs.color) ? Colors.red:Colors.green,),
      drawer: NavWidget(),
      body: ListView(
        children:[
          Container(padding: EdgeInsets.symmetric(horizontal:20,vertical:10), child: Text('Ajustes',style: TextStyle(fontSize:40,fontWeight:FontWeight.bold,))),
          Divider(),
          SwitchListTile(
            title: Text('Color'),
            value: _color, 
            onChanged: (value){ setState(() { _color = value; prefs.color = value;}); },
          ),
          RadioListTile(
            title: Text('Masculino'), 
            value: 1, 
            groupValue: _sexo, 
            onChanged: (value){ setState(() { _sexo = value; prefs.sexo = value;}); }
          ),
          RadioListTile(
            title: Text('Femenino'), 
            value: 2, 
            groupValue: _sexo, 
            onChanged: (value){ setState(() { _sexo = value; prefs.sexo = value;}); }
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal:20),
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre la persona',
              ),
              onChanged: (value) { prefs.name = value;},
            ),
          )
        ]
      ),
    );
  }
}