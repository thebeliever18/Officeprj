import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:office_prj/main.dart';
import 'package:office_prj/orientation.dart';

import 'dropDownDecoration.dart';
import 'orientation.dart';
import 'orientation.dart';

class PageAfterCont extends StatefulWidget {
  final context;
  PageAfterCont(this.context);
  @override
  State<StatefulWidget> createState() {
    return PageAfterContState(context);
  }
}

class PageAfterContState extends State<PageAfterCont> {
  final icn = Icon(Icons.person_outline);
  final iconForEmail = Icon(Icons.alternate_email);
  final inputType = TextInputType.text;
  final obscureText = false;
  bool checkBoxState = false;
  PageAfterContState(context);
  /*
   * For password visibility toggle button
   * 
   */

  bool _hidden = true;
  void _visibility() {
    setState(() {
      _hidden = !_hidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    double defaultWidth = MediaQuery.of(context).size.width / 25;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          textField(
            context,
            defaultWidth,
            'First Name',
            icn,
            inputType,
          ),
          textField(context, defaultWidth, 'Middle Name', icn, inputType),
          textField(context, defaultWidth, 'Last Name', icn, inputType),
          textField(context, defaultWidth, 'Email', iconForEmail, inputType),
      /*
       * For password textfield
       */
          Padding(
            padding: EdgeInsets.all(3.5),
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  labelText: 'Password',
                  icon: Icon(Icons.lock_outline),
                  contentPadding: EdgeInsets.all(defaultWidth),
                  suffixIcon: IconButton(
                    onPressed: _visibility,
                    icon: _hidden
                        ? Icon(Icons.visibility_off)
                        : Icon(Icons.visibility),
                  )),
              keyboardType: inputType,
              obscureText: _hidden,
            ),
          ),
          DropDownDecoration(context)
        ]);
  }

  checkBoxClicked() {
    setState(() {
      if (checkBoxState) {
        checkBoxState = !checkBoxState;
      } else {
        checkBoxState = !checkBoxState;
      }
    });
  }
}
