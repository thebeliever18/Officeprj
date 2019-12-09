import 'package:flutter/material.dart';
import 'package:office_prj/main.dart';

import 'main.dart';

/*
 * Creating Stateful Widget
 * Stateful widget are mutable 
 */
class TextForms extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TextFormsState();
}

class TextFormsState extends State<TextForms> {
  TextFormsState();
  static final  otpPhonenumber=TextEditingController();
  @override
  Widget build(BuildContext context) => layoutDetails(context);

  Widget textForms(defaultWidth, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        textField(context, defaultWidth, 'Phone Number', Icon(Icons.phone),
            TextInputType.number,otpPhonenumber),
        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 10.0),
          child: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Already a user?',
                    style: TextStyle(color: Colors.black, fontSize: 16.0),
                  ),
                  Text(''),
                  Material(
                    color: Colors.white,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                            return LoginPage();
                        }));
                        },
                        splashColor: Color.fromARGB(255, 0, 56, 147),
                        child: Text('Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline)),
                      ),
                  ),
                ]),
          ),
        ),
      ],
    );
  }

/*
 * Code for changing orientation 
 */
  layoutDetails(context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      double defaultWidth = MediaQuery.of(context).size.width / 25;
      return textForms(defaultWidth, context);
    } else {
      double defaultWidth = MediaQuery.of(context).size.width / 400;
      return textForms(defaultWidth, context);
    }
  }
}

Widget textField(context, defaultWidth, labelText, iconn, inputType,getController,[hintText]) {
  return Padding(
    padding: EdgeInsets.all(3.5),
    child: TextFormField(
      controller: getController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
        labelText: '$labelText',
        hintText: hintText,
        icon: iconn,
        contentPadding: EdgeInsets.all(defaultWidth),
      ),
      keyboardType: inputType,
    ),
  );
}
