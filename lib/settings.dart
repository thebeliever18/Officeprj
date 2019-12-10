import 'package:flutter/material.dart';



class Setting extends StatefulWidget {
  @override
  SettingState createState() => SettingState();
}

class SettingState extends State<Setting> {
  bool _value = false;
  /**
   * When the state of the switch is changed
   */
  void _onChanged(bool value) {
    setState(() {
      _value = value;
    });
  }

  bool _value2 = false;
   /**
   * When the state of the switch is changed
   */
  void _onChanged2(bool value2) {
    setState(() {
      _value2 = value2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text("Settings"),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
      ),
      body: ListView(
        // padding: EdgeInsets.all(20.0),

        children: <Widget>[
          // Switch(value: _value,
          //   onChanged: (bool value) {_onChanged(value);}),
          SwitchListTile(
              value: _value,
              title: Text(
                "Finger Print",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "Enable finger print authentication to  secure your account data"),
              activeColor: Colors.green,
              isThreeLine: true,
              /**
               * Called when the user initiates a change
               */
              onChanged: (bool value) {
                _onChanged(value);
              }),
          Divider(
            color: Colors.black,
          ),
          /**
           * List tile with a switch
           */
          SwitchListTile(
              value: _value2,
              title: Text(
                "Notification",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                  "Enable Notification so that you will be notified when your order status changed"),
              activeColor: Colors.green,
              /**
               * Called when the user initiates the change
               */
              onChanged: (bool value2) {
                _onChanged2(value2);
              }),
        ],
      ),
    );
  }
}
