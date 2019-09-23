import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
         Center(
            child:Padding(
                padding: EdgeInsets.all(20),
           
                child: Text("Forgot Password",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text("Enter your 10 digit  number",
                  style:
                      TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold)),
            ),
          ),
          Center(
            child: Padding(
             
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
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
            margin: EdgeInsets.only(top: 60.0),
             height: MediaQuery.of(context).size.height / 12,
            width: MediaQuery.of(context).size.width / 1.15,
          
          
           
           
            child: RaisedButton(
                color: Colors.blue[900],
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
                elevation: 6.0,
                onPressed: ()  {

                },
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)
                ),
                
          ),
          ),
        ],
      ),
    );
  }
}
