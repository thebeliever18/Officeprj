import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

/*
 * Modifying Drop down box 
 */
String dropdownValue;
class DropDownDecoration extends StatefulWidget {
  final context;
  DropDownDecoration(this.context);
  @override
  State<StatefulWidget> createState() {
    return DropDownDecorationState(context);
  }
}

class DropDownDecorationState extends State<DropDownDecoration> {
  DropDownDecorationState(context);
 
  @override
  Widget build(BuildContext context) {
    double leftPadding = MediaQuery.of(context).size.width / 20;
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left:6.5),
          child: Icon(MdiIcons.genderMaleFemale,color: Colors.grey,),
        ),
        Stack(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Padding(
                padding: EdgeInsets.only(left: leftPadding-10),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[600]),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  height: 47,
                  width: MediaQuery.of(context).size.width-110,
                  child: Padding(
                    padding: EdgeInsets.only(left:15.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: Text('Select your gender*'),
                        value: dropdownValue,
                        iconSize: 30.0,
                        //elevation: 25,
                        items: <String>['Male', 'Female', 'Others']
                            .map<DropdownMenuItem<String>>((String vvalue) {
                          return DropdownMenuItem<String>(
                            value: vvalue,
                            child: Text(vvalue),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              )),
        ],
  ),
      ],
    );
}
}
  
