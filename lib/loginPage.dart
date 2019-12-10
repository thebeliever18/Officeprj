import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:office_prj/forgotPasswordPage.dart';
import 'package:office_prj/homePage.dart';
import 'package:office_prj/pageAfterCont.dart';
import 'package:office_prj/otpPage.dart';
import 'package:http/http.dart' as http;
import 'package:office_prj/registrationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'main.dart';

// void main() {
//   runApp(Main());
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     systemNavigationBarColor: Colors.blue[900], // navigation bar color
//     statusBarColor: Colors.blue[900], // status bar color
//   ));
// }

// class Main extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     print("hello");
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Chart',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         body: LoginPage(),
//       ),
//     );
//   }
// }

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  static var customerName;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  var sizebox = SizedBox(
    height: 10,
  );

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                dsewaLogo(context),
                TextFormField(
                  maxLength: 10,
                  maxLengthEnforced: true,
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your Phone';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      counterText: "",
                      prefixIcon: Icon(Icons.phone),
                      labelText: "phone",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
                sizebox,
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your Password';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      labelText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                ),
                sizebox,
                ButtonTheme(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  minWidth: MediaQuery.of(context).size.width - 10,
                  height: 45,
                  child: RaisedButton(
                    color: Colors.blue[900],
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                    onPressed: () {
                      signIn(phoneController.text, passwordController.text);
                    },
                  ),
                ),
                MaterialButton(
                  splashColor: Colors.blue[900],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ForgotPasswordPage();
                    }));
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  minWidth: MediaQuery.of(context).size.width,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Not registered Yet?"),
                          MaterialButton(
                            splashColor: Colors.blue[900],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            minWidth: 5,
                            height: 5,
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return RegistrationPage();
                              }));
                            },
                            child: Text("Register now"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  void signIn(String phone, String password) async {
    Map data = {'phone': phone, 'password': password};
    try {
      var jsonData = null;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var response = await http
          .post("http://test.dsewa.com.np/api/customer/login", body: data);
      if (response.statusCode == 200) {
        jsonData = json.decode(response.body);

        setState(() {
          sharedPreferences.setString(
              "token", jsonData['access_token']);
          var accessToken = jsonData['access_token'];

          customerName = jsonData['name'];

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (BuildContext context) => Nextpage(accessToken)),
              (Route<dynamic> route) => false);
        });
      } else {
        print(response.body);
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('No Internet Connected'),
            content: Text('Please turn on wifi or mobile data'),
            actions: <Widget>[
              RaisedButton(
                child: Text(
                  'ok',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }
}

String validatephone(String value) {}

/*
 * Design for dsewa logo 
 */
Widget dsewaLogo(context) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Material(
            borderRadius: BorderRadius.circular(150),
            elevation: 9.0,
            child: Container(
              height: 1,
              width: 250,
              child: SvgPicture.asset(
                "images/Delta.svg",
                height: 50,
                width: 100,
                color: Colors.blue[900],
              ),
            ),
          ),
        ))
      ],
    ),
  );
}
