import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:office_prj/main.dart';
import 'package:office_prj/orientation.dart';
import 'dropDownDecoration.dart';
import 'orientation.dart';

/*
 * Registration page textfield UI
 */
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
  final phoneInputType = TextInputType.phone;
  final iconForPhone = Icon(Icons.phone);

  /*
   * @obscureText to hide/show password
   */
  final obscureText = false;

  bool checkBoxState = false;
  PageAfterContState(context);

  /*
   * Controller for all the feilds for registration page
   */
  static final nameController = TextEditingController();
  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();
  static final phoneController = TextEditingController();
  static final phoneTwoController = TextEditingController();

  /*
   * For password visibility toggle button
   * 
   */
  static String errorMessage;
  static bool errorMesg;
  bool _hidden = true;
  void _visibility() {
    errorMesg = false;
    errorMessage = "";
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
            'Name*',
            icn,
            inputType,
            nameController,
          ),
          //textField(context, defaultWidth, 'Middle Name', icn, inputType),
          //textField(context, defaultWidth, 'Last Name', icn, inputType),
          textField(context, defaultWidth, 'Email*', iconForEmail, inputType,
              emailController),

          Padding(
            padding: EdgeInsets.all(3.5),
            child: TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  labelText: 'Password*',
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

          textField(context, defaultWidth, 'Phone 1*', iconForPhone,
              phoneInputType, phoneController, 'Required'),
          textField(context, defaultWidth, 'Phone 2', iconForPhone,
              phoneInputType, phoneTwoController, 'Optional'),
          /**
       * Displaying error message if any of the text field is empty in registration page except for phone 2.
       */
          if (errorMesg == true)
            displayErrorMessage(),

          /**
       * For password textfield
       */

          //DropDownDecoration(context)
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

  /*
   * Displaying error messege in red color for only 5 seconds in registration page
   * if any of the field is not validate
   */
  displayErrorMessage() {
    Future.delayed(
      Duration(seconds: 5),
      () {
        setState(() {
          errorMesg = false;
        });
      },
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 35,
        ),
        Container(
          //color: Colors.grey,
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
