import 'package:flutter/material.dart';
import 'package:office_prj/orientation.dart';
import 'package:office_prj/pageAfterCont.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:office_prj/registrationapi.dart';
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


bool isForm = true;
bool signup = true;
/**
 * Registration page
 */
class RegistrationPage extends StatelessWidget {
  /*
   * This widget is the root of your application.
   */
  @override
  Widget build(BuildContext context) {
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
int a = 1;

class FormsState extends State<Forms> {
  // static String errorMessage;
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
                    /**
                     * Calling dSewa logo
                     */
            child: dsewaLogo(context),
          )),
          Center(
              child: Padding(
            padding: EdgeInsets.only(top: heightPadding + 5.0),
            child: //isForm
                //? form(context)
                 form(context,
                    child: PageAfterCont(context), color: Colors.white),
          )),
          Center(
            child: Padding(
                padding: EdgeInsets.only(top: heightPadding + 20.0),
                child: btn(context)),
          )
        ],
      ),
    );
  }

/*
 * Code for continue button
 */
  Widget btn(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ButtonTheme(
          height: (MediaQuery.of(context).size.height) / 12,
          minWidth: (MediaQuery.of(context).size.width) - 25,
          child: RaisedButton(
            child: Text(
              'Continue',
              style: TextStyle(fontSize: 25.0, color: Colors.white),
            ),
            onPressed: () {
                /**
                 * Checking if any field is null or not in registration page
                 */
                if (PageAfterContState.nameController.text.isEmpty ||
                    PageAfterContState.emailController.text.isEmpty ||
                    PageAfterContState.passwordController.text.isEmpty ||
                    PageAfterContState.phoneController.text.isEmpty) {
                  a = 2;
                  setState(() {
                    /**
                     * Display error message if any field is null except for phone 2
                     */
                    PageAfterContState.errorMesg = true;
                    PageAfterContState.errorMessage =
                        "All the feilds are required. Phone 2 is optional";
                  });
                }
                /**
                 * Validation for phone 2
                 */
                else if(PageAfterContState.phoneTwoController.text.isNotEmpty 
                          && PageAfterContState.phoneTwoController.text.length != 10){
                            setState(() {
                              PageAfterContState.errorMesg = true;
                              PageAfterContState.errorMessage =
                            "Please enter 10 digit number for Phone 2";
                            });
                            
                }
                /**
                 * Validation for email and phone 1
                 */
                else if (PageAfterContState.emailController.text.isNotEmpty ||
                    PageAfterContState.phoneController.text.isNotEmpty) {
                  checkEmailPattern(PageAfterContState.emailController.text);
                  if (((PageAfterContState.phoneController.text.length == 10) &&
                          (checkEmailPattern(
                                  PageAfterContState.emailController.text)) ==
                              "matched")) {
                    navigateToLoginPage();
                  } else {
                    setState(() {
                      PageAfterContState.errorMesg = true;
                      if (checkEmailPattern(
                              PageAfterContState.emailController.text) ==
                          "Not matched") {
                        PageAfterContState.errorMessage =
                            "Please enter standard email pattern";
                      } else {
                        PageAfterContState.errorMessage =
                            "Please enter 10 digit number for Phone 1";
                      }
                    });
                  }
                }else{
                  navigateToLoginPage();
                }
            },
            color: Color.fromARGB(255, 0, 56, 147),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ],
    );
  }

  /*
  * validation for email pattern
  */
  checkEmailPattern(value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      a = 2;
      setState(() {
        PageAfterContState.errorMesg = true;
        PageAfterContState.errorMessage = "Invalid email standard";
      });
      return "Not matched";
    } else {
      return "matched";
    }
  }

  /*
   * After successful api calling navigate to api page
   */
  navigateToLoginPage() {
    setState(() {
      PageAfterContState.errorMesg = false;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return RegistrationApi(
        PageAfterContState.emailController.text,
        PageAfterContState.passwordController.text,
        PageAfterContState.phoneController.text,
        PageAfterContState.phoneTwoController.text,
        PageAfterContState.nameController.text,
      );
    }));
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

/*
 * Old version of registration page
 * The UI of conatiner will get increased after pressing continue button
 */
Widget form(context, {color = Colors.white, child}) {
  return Container(
    child: child ?? TextForms(),
    height: managing(context),
    width: (MediaQuery.of(context).size.width / 3) * 2.5,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: color),
  );
}

managing(context) {
  // if (isForm) {
  //   return MediaQuery.of(context).size.height / 6.5;
  // } else {
    /**
     * Gap between textfields and continue button in registration page
     */
    return MediaQuery.of(context).size.height - 360;
}

