import 'package:flutter/material.dart';
import 'package:office_prj/pageAfterCont.dart';
import 'package:office_prj/forgotPasswordPage.dart';

import 'main.dart';

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  var _otp;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: Text(
                            "Enter Code",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Text(
                              "We have sent you 4 digit code",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              "Via SMS for mobile number Verification",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                          ),
                        ),
                        Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            txtfld(),
                            sizewidth(4),
                            txtfld(),
                            sizewidth(4),
                            txtfld(),
                            sizewidth(4),
                            txtfld(),
                          ],
                        )),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 1.0),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              width: 150,
                              height: 50,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                color: Color.fromARGB(255, 0, 56, 147),
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      color: Colors.white,
                                      backgroundColor: Color.fromARGB(255, 0, 56, 147),
                                      fontSize: 30),
                                ),
                                onPressed: () {
                                  setState(() {
                                    isForm = !isForm;
                                  });
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return RegistrationPage();
                                  }));
                                  //showMessage(context, _otp);
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Text(
                            "Didn't Recieve the Code ?",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        FlatButton(
                          child: Text("Resend code?",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 56, 147))),
                          onPressed: () {
                            var dialog = AlertDialog(
                              backgroundColor: Colors.grey[200],
                              title: Text("Succesfull"),
                              content: Text("Code is sent to your phone"),
                              actions: <Widget>[
                                RaisedButton(
                                    color: Color.fromARGB(255, 0, 56, 147),
                                    child: Text(
                                      "OK",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20,backgroundColor: Colors.white),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    })
                              ],
                            );
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return dialog;
                                });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
forOtpPage;
SizedBox sizewidth(double a) {
  return SizedBox(
    width: a,
  );
}

txtfld() {
  return Container(
  
    padding: EdgeInsets.only(top: 5),
    width: 60,
    height: 60,
    child: TextField(
      autofocus: true,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
      ),
      maxLength: 1,
      maxLengthEnforced: true,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(
         counterText: '',
          fillColor: Colors.grey[200],
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 5.0),
              borderRadius: BorderRadius.circular(0))),
    ),
  );
}

showMessage(BuildContext context, var message) {
  var dialog = AlertDialog(
    backgroundColor: Colors.grey[200],
    title: message.toString().length == 2 && message != null
        ? Text("Succesfull")
        : Text("Invalid"),
    content:
        message.toString().length == 4 ? Text("Entered OTP is $message") : null,
    actions: <Widget>[
      RaisedButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          })
    ],
  );
  showDialog(
      context: context,
      builder: (context) {
        return dialog;
      });
}

