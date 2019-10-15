import 'package:flutter/material.dart';


class Userprofile extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      home: new UserProfile(),
  );

  }
  
}

class UserProfile extends StatefulWidget{

 @override
  State createState() => new UserProfileState();
}

class UserProfileState extends State<UserProfile>{
  @override 
  Widget build (BuildContext context){
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40),
        
        child: Stack(
          children: <Widget>[
           
            Text("Welcome User", textAlign: TextAlign.center,),
            
            userimg(),
          ],
        ),
      ),

    );
  } 
}

userimg(){
  return Container(
  margin: EdgeInsets.only(top: 100, left: 50),
   alignment: Alignment.center,
                            width: 200.0,
                            height: 200.0,
                            
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.0),
                              border: Border.all(color: Colors.blue),
                              
                              
                            ),
                            child: Text("Your Photo"),

    );
}
SizedBox sizewidth(double b) {
    return SizedBox(
      width: b,
    );
  }