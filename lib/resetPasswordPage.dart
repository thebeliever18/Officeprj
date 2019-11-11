import 'package:flutter/material.dart';

import 'loginPage.dart';

class PasswordRestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home: ResetPage(),
    );
  }
}

class ResetPage extends StatefulWidget {
  @override
  ResetPageState createState() => ResetPageState();
}

class ResetPageState extends State<ResetPage> {
  bool _isHidden = true;
  bool _second = true;
  GlobalKey<FormState> _key = new GlobalKey();

  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();
  bool _validate = false;
  String password, confirmpassword;
  // String password;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _another() {
    setState(() {
      _second = !_second;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Form(
          autovalidate: _validate,
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: 100.0, right: 20.0, left: 20.0, bottom: 20.0),
              ),
              top(),
              SizedBox(
                height: 40.0,
              ),
              buildTextField("New Password"),
              SizedBox(
                height: 20.0,
              ),
              buildTextFieldtwo("Confirm Password"),
              SizedBox(
                height: 20.0,
              ),
              // Container(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.end,

              //   ),
              // ),
              SizedBox(height: 50.0),
              buildButtonContainer(),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ));
  }

  Widget buildTextField(String labelText) {
    return TextFormField(
      validator: validatePassword,
      controller: _passwordController,
      onSaved: (String val) {
        password = val;
      },
      decoration: InputDecoration(
        labelText: labelText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: labelText == "New Password"
            ? IconButton(
                onPressed: _toggleVisibility,
                icon: _isHidden
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : null,
      ),
      obscureText: _isHidden,
    );
  }

  Widget buildTextFieldtwo(String labelText) {
    return TextFormField(
      controller: _confirmpasswordController,
      validator: validatePasswordMatching,
      onSaved: (String val) {
        confirmpassword = val;
      },
      decoration: InputDecoration(
        labelText: labelText,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        suffixIcon: labelText == "Confirm Password"
            ? IconButton(
                onPressed: _another,
                icon: _second
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : null,
      ),
      obscureText: _second,
    );
  }

  Widget top() {
    return Container(
        child: Column(
      children: <Widget>[
        Text(
          "Reset Password",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 20.0),
            child: Text(
              "A minimum 8 characters password contains a combination of uppercase and lowercase letter and number are required.",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    ));
  }

  Widget buildButtonContainer() {
    return Container(
      margin: EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
      width: MediaQuery.of(context).size.width / 1,
      height: MediaQuery.of(context).size.height / 11,
      child: RaisedButton(
        color: Colors.blue[900],
        child: Text(
          "Save",
          style: TextStyle(fontSize: 25.0, color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0)),
        elevation: 6.0,
        onPressed: () {
          if (_key.currentState.validate()) {
            // No any error in validation
            _key.currentState.save();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return LoginPage();
            }));
          } else {
            // validation error
            setState(() {
              _validate = true;
            });
          }
        },
      ),
    );
  }

  String validatePassword(String value) {
    if (value.length == 0) {
      return "Password is Required";
    } else if (value.length != 8) {
      return "Password Should be  8.";
    }
    return null;
  }

  String validatePasswordMatching(String value) {
    if (value.length == 0) {
      return "Password is Required";
    } else if (value != _passwordController.text) {
      return 'Password is not matching';
    } else if (value.length != 8) {
      return "Password Should be 8 digits.";
    }

    return null;
  }
}
