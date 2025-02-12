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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
             child:Padding(
                 padding: EdgeInsets.all(5.0),
           
                child: Text("Forget Password",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ),
           ),
           Center(
            child: Padding(
              padding:  EdgeInsets.all(25.0),
              child: Text("Enter your 10 digit  number",
                  style:
                      TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold)),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
              
              child: TextField(
              
                controller: _textFieldController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                
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
            width: MediaQuery.of(context).size.width  /1,
            height: MediaQuery.of(context).size.height /11,
            child: RaisedButton(
                color: Colors.blue[900],
                child: Text(
                  "Continue",
                   style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
                elevation: 6.0,
                onPressed: () {
                  //bool forOtpPage = true;
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return OtpPage(boolValue: true);
                  }));
                  
                },
                 shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)
                ),
                ),
          )
        ],
      ),
    );
  }
}
