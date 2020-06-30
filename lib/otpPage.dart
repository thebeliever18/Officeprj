import 'package:flutter/material.dart';
import 'package:office_prj/registrationPage.dart';
import 'package:office_prj/resetPasswordPage.dart';



var firstFieldController = TextEditingController();
var secondFieldController = TextEditingController();
var thirdFieldController = TextEditingController();
var fourthFieldController = TextEditingController();

final FocusNode firstFocus = FocusNode();  
final FocusNode secondFocus = FocusNode();  
final FocusNode thirdFocus = FocusNode();
final FocusNode fourthFocus = FocusNode();
class OtpPage extends StatefulWidget {
  /*It is a compile-time error for a class to attempt to extend or implement bool. */
  bool boolValue;
  OtpPage({this.boolValue});
  _OtpPageState createState() => _OtpPageState(this.boolValue);
}

class _OtpPageState extends State<OtpPage> {
  bool boolValue;
  _OtpPageState(this.boolValue);
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: ListView(
            children: <Widget>[
              Stack(
                /**
                 * This class is useful if you want to overlap several children in a simple way, for example having some text and an image, overlaid with a gradient and a button attached to the bottom.
                 */
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column( /**This widget allows its children in vertical array */
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
                              /**This widget displays its children to display in horizontal array */
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            txtfld(false,firstFieldController,firstFocus,context,TextInputAction.next,secondFocus),
                            sizewidth(4),
                            txtfld(false,secondFieldController,secondFocus,context,TextInputAction.next,thirdFocus),
                            sizewidth(4),
                            txtfld(false,thirdFieldController,thirdFocus,context,TextInputAction.next,fourthFocus),
                            sizewidth(4),
                            txtfld(true,fourthFieldController,fourthFocus,context,TextInputAction.done,fourthFocus),
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

                                  /**
                                   * If forOtpPage is true than the password resetting page is opened.
                                   * Else Normal Registration page is opened 
                                   */

                                  if(boolValue==true){
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return PasswordRestPage();
                                  }));
                                  }else{
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return RegistrationPage();
                                  }));
                                  }
                                  
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
SizedBox sizewidth(double a) {
  return SizedBox(
    width: a,
  );
}


txtfld(boolVal,getController,getFocus,context,nextordone,nextFocus) {
  return Container(
  
    padding: EdgeInsets.only(top: 5),
    width: 60,
    height: 60,
    child: TextFormField(
      controller: getController,
      textInputAction: nextordone,
      focusNode: getFocus,
      textAlign: TextAlign.center,
      onFieldSubmitted: (value){
        if (!boolVal) {
          fieldFocusChange(context, getFocus, nextFocus);
        } else {
          getFocus.unfocus();
        }
          
          
        },
      style: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
      ),
      maxLength: 1, /** This allows only one number to be entered at a time */
      maxLengthEnforced: true,
      keyboardType: TextInputType.number, /**This allows keyboard to enter number only */
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

fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);  
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
            /**By using the Navigator.pop() method. The pop() method removes the current Route from the stack of routes managed by the Navigator. */
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

