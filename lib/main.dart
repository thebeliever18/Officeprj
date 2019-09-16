import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_page/next.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new LoginPage(),
        theme: new ThemeData(
          primarySwatch: Colors.green,
        ));
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {

 


  
  String Countrycode = "";
  var _Ccode = [
    '+977',
    '+93',
    '+355',
    '+213',
    '+376',
  ];
  var _currentItemSelected = '+977';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                dsewalogo(),
                sizeheight(70),
                new Form(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Column(
                      children: <Widget>[
                        Row(children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            width: 70.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7.0),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                items: _Ccode.map((String dropDownStringItem) {
                                  return DropdownMenuItem<String>(
                                    value: dropDownStringItem,
                                    child: Text(
                                      dropDownStringItem,
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String newValueSelected) {
                                  setState(() {
                                    this._currentItemSelected =
                                        newValueSelected;
                                  });
                                },
                                value: _currentItemSelected,
                              ),
                            ),
                          ),
                          sizewidth(17),
                          Layout(),
                        ]),
                        sizeheight(15),
                        Password(),
                        sizeheight(10),
                        loginButton(),
                        sizeheight(10),
                        down(),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }


  


  down() {
    return Container(
        padding: EdgeInsets.only(top: 10),
        child: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Dont have an account?",
                style: TextStyle(
                  color: Colors.black,
                ),
                textDirection: TextDirection.ltr,
              ),
              MaterialButton(
                onPressed: () {},
                child: Text(
                  "signup",
                  style: TextStyle(
                      color: Colors.blue, decoration: TextDecoration.underline),
                  textDirection: TextDirection.ltr,
                ),
              ),
            ],
          ),
          sizeheight(170),
          Text("Link with social network",
              style: TextStyle(color: Colors.black, fontFamily: 'GothamBold')),
          sizeheight(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              facebookicon(),
              twittericon(),
              instagramicon(),
            ],
          ),
        ]));
  }

  SizedBox sizeheight(double a) {
    return SizedBox(
      height: a,
    );
  }

  SizedBox sizewidth(double b) {
    return SizedBox(
      width: b,
    );
  }

  
  dsewalogo() {
    return Stack(
      children: <Widget>[
        Container(
          height: 90,
          width: 270.0,
          child: Material(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            elevation: 9.0,
          ),
        ),
        Positioned(
          top: 10,
          left: 12.5,
          child: Image(
            height: 70.0,
            width: 250.0,
            image: new AssetImage("assets/dsewalogo.jpg"),
          ),
        ),
      ],
    );
  }

  Container loginButton() {
    return Container(
      width: double.infinity,
      height: 50,
      child: RaisedButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
          return Nextpage();
          }),);
        
        },
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        color: Colors.blue[900],
        child: Text("Login",
            style: TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }


  facebookicon() {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      child: IconButton(
        alignment: Alignment.center,
        onPressed: () {},
        icon: Icon(
          FontAwesomeIcons.facebook,
          size: 33,
          color: Colors.blue,
        ),
      ),
    );
  }

  instagramicon() {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          FontAwesomeIcons.instagram,
          size: 33,
          color: Colors.blue,
        ),
      ),
    );
  }

  twittericon() {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      child: IconButton(
        onPressed: () {},
        icon: Icon(FontAwesomeIcons.twitter, size: 33, color: Colors.blue),
      ),
    );
  }
}

class Layout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LayoutState();
  }
}

class LayoutState extends State<Layout> {
  
  @override
  Widget build(BuildContext context) {
    return layoutDetails(context);
  }


phoneNo(defaultWidth, defaultHeight, context) {
  return Container(
    width: defaultWidth,
    height: defaultHeight,
    child: TextFormField(
      decoration: new InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Mobile number",
        labelText: "Enter your number",
        filled: true,
        fillColor: Colors.white10,
      ),
      keyboardType: TextInputType.number,
    ),
  );
}


layoutDetails(context) {
  Orientation orientation = MediaQuery.of(context).orientation;
  if (orientation == Orientation.portrait) {
    double defaultWidth = MediaQuery.of(context).size.width / 2.1;
    double defaultHeight = MediaQuery.of(context).size.height / 16;
    return phoneNo(defaultWidth, defaultHeight, context);
  } else {
    double defaultWidth = MediaQuery.of(context).size.width / 2;
    double defaultHeight = MediaQuery.of(context).size.height / 10;
    return phoneNo(defaultWidth, defaultHeight, context);
  }
}
}

class Password extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PasswordState();
  }
}

class PasswordState extends State<Password> {

   bool _isHidden = true;
  void _toogleVisibility(){
    setState(() {
     _isHidden = !_isHidden;
    });

  }
  
  @override
  Widget build(BuildContext context) {
  return Container(
    width: 240,
    height: 50,
    child: TextFormField(
      decoration: new InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Password",
        hintStyle: TextStyle(
          
          color: Colors.grey,
          fontSize:  16.0,
        ),
       suffixIcon:  IconButton(
         onPressed: _toogleVisibility,
         icon: _isHidden ? Icon(Icons.visibility_off): Icon(Icons.visibility),
       ),
       icon: const Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      ),
        filled: true,
        fillColor: Colors.white10,
      ),
      
      obscureText: _isHidden,
      
    ),
    
    
  );
}


 
}


