import 'package:flutter/material.dart';
import 'package:office_prj/otpPage.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Forgot",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyButton(),
    );
  }
}

class MyButton extends StatefulWidget {
  MyButton({Key key}) : super(key: key);

  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  TextEditingController _textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      
      body: ListView(
        children: <Widget>[
          
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0),
              
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _textFieldController,
                decoration: InputDecoration(
                  labelText: " Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
            width: MediaQuery.of(context).size.width / 2,
            height: MediaQuery.of(context).size.height - 600,
            child: RaisedButton(
                color: Colors.blueAccent,
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
                elevation: 6.0,
                onPressed: () {
                  bool forOtpPage = true;
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return OtpPage();
                  }));
                }),
          )
        ],
      ),
    );
  }
}
