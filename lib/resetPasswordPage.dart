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
      body: Container(
        padding:
            EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
              ),
            ),
            SizedBox(height: 50.0),
            buildButtonContainer(),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText) {
    return TextField(
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
    return TextField(
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
      height: MediaQuery.of(context).size.height /11,
      width: MediaQuery.of(context).size.width  /1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.blue[900],
      ),
      child: Center(
        child: RaisedButton(
          child: Text(
            "Save",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
          },
         
          
            
          // child: Text(
          //   "Save",
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontSize: 18.0,
          //   ),
          // ),
          
          
            ),
        ),
      );
    
  }
}
