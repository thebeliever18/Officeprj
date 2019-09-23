import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Forgot Password"),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0),
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
            margin: EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
            width: MediaQuery.of(context).size.width/2,
            height: MediaQuery.of(context).size.height-600,
            
                

            child: RaisedButton(
                color: Colors.blueAccent,
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white),
                ),
                
                elevation: 6.0,
                onPressed: () => (context)),
                
          )
        ],
      ),
    );
  }
}
