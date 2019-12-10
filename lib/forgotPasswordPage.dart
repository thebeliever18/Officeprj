import 'package:flutter/material.dart';
import 'package:office_prj/otpPage.dart';

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Forgot",
      theme: ThemeData(
        primaryColor: Colors.blue[900],
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
  /**
   * Used to provide an initial value for a text field
   */
  GlobalKey<FormState> _key = new GlobalKey();
  /**
   * uniquely identifies the form
   */
  bool _validate = false;
  String mobile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      autovalidate: _validate,
      key: _key,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Container(
          //   child: Icon(

          //                    Icons.phone,
          //                    color: Colors.grey,

          //                   )

          //                 ),
          //                 sizewidth(15),
          //                 Container(

          //                   width: 70.0,
          //                   height: 47.0,

          // ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Text("Forget Password",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ),
          Center(
           
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: Text("Enter your 10 digit  number",
                  style:
                      TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold)),
            ),
          ),
          Center( 
            
            child: Padding(
              padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
              child: TextFormField(
                controller: _textFieldController,
                /**
                 * Connecting the TextEditing controller to a text field
                 */
                keyboardType: TextInputType.number,
                validator: validateMobile,
                onSaved: (String val) {
                  mobile = val;
                },
                decoration: InputDecoration(
                 
                  labelText: " Phone Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  
                ),
              ),
            ),
          ),
          //  Center(
          //   child: Padding(
          //     padding:  EdgeInsets.all(25.0),
          //     child: Text("Enter your 10 digit  number",
          //         style:
          //             TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold)),
          //   ),
          // ),
          Container(
            margin: EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
            width: MediaQuery.of(context).size.width / 1,
            height: MediaQuery.of(context).size.height / 11,
            child: RaisedButton(
              color: Colors.blue[900],
              child: Text(
                "Continue",
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
              elevation: 6.0,
              onPressed: () {
                if (_key.currentState.validate()) {
                  // No any error in validation
                  _key.currentState.save();
                  /**
                   * If the given field is validated then navigate to Otp page
                   */
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return OtpPage(boolValue: true);
                  }));
                } else {
                  // validation error
                  setState(() {
                    _validate = true;
                  });
                }
              },
            ),
          )
        ],
      ),
    ));
  }

  /**
   * Regex expression used for validation of required pattern
   */
  String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile is Required";
    } else if (value.length != 10) {
      return "Mobile number must be 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }
}
