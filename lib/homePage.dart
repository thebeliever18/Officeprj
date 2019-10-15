import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:office_prj/Userprofile.dart';

class Nextpage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: new HomePage(),
    );
  }

}
class HomePage extends StatefulWidget{

 @override
  State createState() => new HomePageState();
}

class Constants{
  static const String Settings = 'Settings';
  static const String More = 'More...';
  static const String SignOut = 'Sign Out';
  static const String Report = 'Report us';

  static const List<String> choices = <String>[
    Settings,
    More,
    SignOut,
    Report

  ];
  
}

class HomePageState extends State<HomePage>{
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("dSewa"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return Userprofile();
            }),
          );

            },
          ),
          PopupMenuButton<String>(
            onSelected: choiceAction,
            itemBuilder: (BuildContext context){
              return Constants.choices.map((String choice){
             return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
              );
              }).toList();
            },
            
          )
        ],),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(40),
        child: Stack(
          children: <Widget>[
            Text('welcome to the homepage', textAlign: TextAlign.center,)
          ],

        )
      ),
    );
}

void choiceAction(String choice){
  print('working');
}




}