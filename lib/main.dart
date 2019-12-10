// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:office_prj/forgotPasswordPage.dart';
// import 'package:office_prj/homePage.dart';

// import 'main.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   State createState() => new LoginPageState();
// }

// class LoginPageState extends State<LoginPage> {

//   String Countrycode = "";
//   var _Ccode = [
//     '+977',
//     '+93',
//     '+355',
//     '+213',
//     '+376',
//   ];
//   var _currentItemSelected = '+977';

//   @override
//   Widget build(BuildContext context) {
//     Padding(
//       padding: EdgeInsets.only(top: 200),

//     );
//     return MaterialApp(

//       home: Scaffold(
//       resizeToAvoidBottomPadding: false,
//       backgroundColor: Colors.white,
//       body: Container(
//         child: Stack(
//           fit: StackFit.expand,
//           children: <Widget>[
//             new Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 dsewalogo(),
//                 sizeheight(70),
//                 new Form(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 40, right: 40),
//                     child: Column(
//                       children: <Widget>[
//                         Row(children: <Widget>[
//                           Container(
//                             child: Icon(

//                              Icons.phone,
//                              color: Colors.grey,

//                             )

//                           ),
//                           sizewidth(15),
//                           Container(
//                             alignment: Alignment.center,
//                             width: 70.0,
//                             height: 47.0,

//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(7.0),
//                               border: Border.all(color: Colors.grey),

//                             ),

//                             child: DropdownButtonHideUnderline(
//                               child: DropdownButton<String>(

//                                 items: _Ccode.map((String dropDownStringItem) {
//                                   return DropdownMenuItem<String>(
//                                     value: dropDownStringItem,
//                                     child: Text(
//                                       dropDownStringItem,
//                                     ),
//                                   );
//                                 }).toList(),
//                                 onChanged: (String newValueSelected) {
//                                   setState(() {
//                                     this._currentItemSelected =
//                                         newValueSelected;
//                                   });
//                                 },
//                                 value: _currentItemSelected,
//                               ),
//                             ),

//                           ),
//                           sizewidth(5),
//                           Layout(),
//                         ]),
//                         sizeheight(15),
//                         Password(),
//                         sizeheight(30),
//                         loginButton(),

//                         sizeheight(10),
//                         MaterialButton(
//                           onPressed: () {
//                             Navigator.push(context,
//                                 MaterialPageRoute(builder: (context) {
//                               return ForgotPasswordPage();
//                             }));
//                           },
//                           child: Text(
//                             "Forget password?",
//                             style: TextStyle(
//                                 color: Colors.blue,
//                               ),
//                             textDirection: TextDirection.ltr,
//                           ),
//                         ),
//                         down(),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     ));
//   }

//   down() {
//     return Container(
//         padding: EdgeInsets.only(top: 10),
//         child: Column(children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[

//               Text(
//                 "Dont have an account?",
//                 style: TextStyle(
//                   color: Colors.black,
//                 ),
//                 textDirection: TextDirection.ltr,
//               ),
//               MaterialButton(
//                 onPressed: () {
//                   setState(() {
//                     isForm = true;
//                   });
//                   Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     return RegistrationPage();
//                   }));
//                 },
//                 child: Text(
//                   "signup",
//                   style: TextStyle(
//                       color: Colors.blue),
//                   textDirection: TextDirection.ltr,
//                 ),
//               ),
//             ],
//           ),
//           sizeheight(60),
//           Text("Link with social network",
//               style: TextStyle(color: Colors.black, fontFamily: 'GothamBold')),
//           sizeheight(30),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: <Widget>[
//               facebookicon(),
//               twittericon(),
//               instagramicon(),
//             ],
//           ),
//         ]));
//   }

//   SizedBox sizeheight(double a) {
//     return SizedBox(
//       height: a,
//     );
//   }

//   SizedBox sizewidth(double b) {
//     return SizedBox(
//       width: b,
//     );
//   }

//   dsewalogo() {
//     return Stack(
//       children: <Widget>[
//         Container(
//           height: 90,
//           width: 270.0,
//           child: Material(
//             borderRadius: BorderRadius.circular(10),
//             color: Colors.white,
//             elevation: 9.0,
//           ),
//         ),
//         Positioned(
//           top: 10,
//           left: 12.5,
//           child: Image(
//             height: 70.0,
//             width: 250.0,
//             image: new AssetImage("assets/dsewalogo.jpg"),
//           ),
//         ),
//       ],
//     );
//   }

//   Container loginButton() {
//     return Container(
//       width: double.infinity,
//       height: 50,
//       child: RaisedButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) {
//               return Nextpage();
//             }),
//           );
//         },
//         shape: new RoundedRectangleBorder(
//           borderRadius: new BorderRadius.circular(10.0),
//         ),
//         color: Colors.blue[900],
//         child: Text("Login",
//             style: TextStyle(
//               color: Colors.white,
//             )),
//       ),
//     );
//   }

//   facebookicon() {
//     return FloatingActionButton(
//       heroTag: 'btn1',
//       onPressed: () {},
//       backgroundColor: Colors.white,
//       child: IconButton(
//         alignment: Alignment.center,
//         onPressed: () {},

//         icon: Icon(
//           FontAwesomeIcons.facebook,
//           size: 33,
//           color: Colors.blue,
//         ),

//       ),
//         //shape: new RoundedRectangleBorder(
//           //borderRadius: new BorderRadius.circular(90.0),
//         //),
//     );
//   }

//   instagramicon() {
//     return FloatingActionButton(
//       heroTag: 'btn2',
//       onPressed: () {},
//       backgroundColor: Colors.white,
//       child: IconButton(
//         onPressed: () {},
//         icon: Icon(
//           FontAwesomeIcons.instagram,
//           size: 33,
//           color: Colors.blue,
//         ),
//       ),
//     );
//   }

//   twittericon() {
//     return FloatingActionButton(
//       heroTag: 'btn3',
//       onPressed: () {},
//       backgroundColor: Colors.white,
//       child: IconButton(
//         onPressed: () {},
//         icon: Icon(FontAwesomeIcons.twitter, size: 33, color: Colors.blue),
//       ),
//     );
//   }
// }

// class Layout extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return LayoutState();
//   }
// }

// class LayoutState extends State<Layout> {
//   @override
//   Widget build(BuildContext context) {
//     return layoutDetails(context);
//   }

// phoneNo(defaultWidth, defaultHeight, context) {
//   return Container(
//     width: defaultWidth,
//     height: defaultHeight,

//     child: TextFormField(
//       maxLength: 10,
//       maxLengthEnforced: true,

//       decoration: new InputDecoration(
//         counterText: '',

//         border: OutlineInputBorder(),
//         hintText: "Mobile number",
//         labelText: "Enter your number",
//         filled: true,
//         fillColor: Colors.white10,
//       ),
//     ),
//   );
//   }

// layoutDetails(context) {
//   Orientation orientation = MediaQuery.of(context).orientation;
//   if (orientation == Orientation.portrait) {
//     double defaultWidth = MediaQuery.of(context).size.width / 2.2;
//     double defaultHeight = MediaQuery.of(context).size.height / 16;
//     return phoneNo(defaultWidth, defaultHeight, context);
//   } else {
//     double defaultWidth = MediaQuery.of(context).size.width / 2;
//     double defaultHeight = MediaQuery.of(context).size.height / 10;
//     return phoneNo(defaultWidth, defaultHeight, context);
//   }
// }
// }

// class Password extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return PasswordState();
//   }
// }

// class PasswordState extends State<Password> {
//   bool _isHidden = true;
//   void _toogleVisibility() {
//     setState(() {
//       _isHidden = !_isHidden;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//   return Container(
//     padding: EdgeInsets.only(right: 30),
//     width: 400,
//     height: 50,

//     child: TextFormField(
//       decoration: new InputDecoration(

//        icon: Icon(Icons.lock),
//         border: OutlineInputBorder(),
//         hintText: "Password",
//         hintStyle: TextStyle(

//           color: Colors.grey,
//           fontSize:  16.0,
//         ),

//        suffixIcon:  IconButton(
//          onPressed: _toogleVisibility,
//          icon: _isHidden ? Icon(Icons.visibility_off): Icon(Icons.visibility),
//        ),

//         filled: true,
//         fillColor: Colors.white10,
//       ),

//       obscureText: _isHidden,

//     ),
//   );
// }
// }
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
void main() {
  runApp(Load());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:
        Color.fromARGB(255, 0, 56, 147), // navigation bar color
    statusBarColor: Color.fromARGB(255, 0, 56, 147), // status bar color
  ));
}

class Load extends StatelessWidget {
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
          body: LoginPage(),
        ));
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  static var customerName;
  static var accessToken;
  bool hidden=true;
  void visibility() {
    setState(() {
      hidden = !hidden;
    });
  }
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
      debugShowCheckedModeBanner: false,
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
                  obscureText: hidden,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your Password';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: hidden
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onPressed: () {
                        visibility();
                      },
                    ),
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
          sharedPreferences.setString("token", jsonData['access_token']);
          accessToken = jsonData['access_token'];
          customerName=jsonData['name'];
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
            title: Text('No internet Connected'),
            content: Text('Please turn on wifi or mobile data'),
            actions: <Widget>[
              RaisedButton(
                child: Text(
                  'Ok',
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
