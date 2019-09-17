import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:office_prj/orientation.dart';
import 'package:office_prj/pageAfterCont.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:flutter/services.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

import 'package:keyboard_avoider/keyboard_avoider.dart';

import 'otpPage.dart';

/*
 * Flutter has built-in function 
 * SystemChrome.setPreferredOrientations 
 * that allows us to set orientation of application.
 * 
 * It has a paramater orientations 
 * whose type is List<DeviceOrientation> on which we 
 * can pass a list of allowed orientations. 
 * It returns Future<void>
 * 
 * To use that function 
 * we need to import package:flutter/services.dart. 
 */

/*
 * Method from where code executes 
 */
void main() {
  runApp(RegistrationPage());
}


bool isForm = true;

class RegistrationPage extends StatelessWidget {
  /*
   * This widget is the root of your application.
   */
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          resizeToAvoidBottomPadding: false,
          body: Forms(),
        ));
  }
}

/*
 * Aligning logo,forms and button in center 
 */
class Forms extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormsState();
  }
}

/*
 * @ScrollController->Controls a scrollable widget.
 * @KeyboardAvoider->A lightweight alternative to the Scaffold widget for avoiding the on-screen software keyboard.
 * For @KeyboardAvoider dependancy is added 
 * @MediaQuery->Establishes a subtree in which media queries resolve to the given data.
 * @autofoucs-> To auto-scroll to a focused widget such as a TextFieldd, set the autoScroll property to true. 
 * If child is not a ScrollView, it is automatically embedded in a SingleChildScrollView to make it scrollable.
 */

class FormsState extends State<Forms> {
  int i = 3;
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var heightPadding = MediaQuery.of(context).size.height / 40;
    return KeyboardAvoider(
      autoScroll: true,
      child: ListView(
        controller: _scrollController,
        children: <Widget>[
          Center(
              child: Padding(
            padding: EdgeInsets.only(top: heightPadding),
            child: dsewaLogo(context),
          )),

          Center(
              child: Padding(
            padding: EdgeInsets.only(top: heightPadding+5.0),
             child: isForm
                ? form(context)
                : form(context, child: PageAfterCont(context), color: Colors.white),
   
          )),
          
          Center(
            child: Padding(
                padding: EdgeInsets.only(top: heightPadding+20.0),
                child: btn(context)),
          )
        ],
      ),
    );
  }

/*
 * Code for button
 */
  Widget btn(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ButtonTheme(
          height: (MediaQuery.of(context).size.height) / 12,
          minWidth: (MediaQuery.of(context).size.width)-25,
          child: RaisedButton(
            child: Text(
              'Continue',
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            ),
            onPressed: () {
              setState(() {
                
              });
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return OtpPage();
              }));
            },
            color: Color.fromARGB(255, 0, 56, 147),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ],
    );
  }
}

/*
 * Design for dsewa logo 
 */
Widget dsewaLogo(context) {
  return Stack(
    children: <Widget>[
      Container(
        height: 90,
        width: 90,
        child: Material(
          borderRadius: BorderRadius.circular(400),
          color: Colors.white,
          elevation: 5.0,
        ),
      ),
      Positioned(
        top: 12,
        left: 12.5,
        child: SvgPicture.asset(
          "images/Delta.svg",
          color: Color.fromARGB(255, 0, 56, 147),
          height: 70,
          width: 70,
        ),
      ),
    ],
  );
}


Widget form(context, {color = Colors.white, child}) {
  return Container(
    child: child ?? TextForms(),
    height:managing(context),
    width: (MediaQuery.of(context).size.width / 3) * 2.5,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: color),
  );
}

managing(context) {
  if (isForm) {
    return MediaQuery.of(context).size.height /6.5;
  } else {
    return MediaQuery.of(context).size.height-260;
  }
}

