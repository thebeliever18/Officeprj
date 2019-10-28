import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:office_prj/Userprofile.dart';
import 'package:office_prj/loginPage.dart';

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
        child: Column(
          children: <Widget>[
           
            
             Container(
              margin: EdgeInsets.only(top: 20),
              
              height: 100,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              
              
             alignment: Alignment.center,
              child: Text('Baby cloth: 24', textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20)),
              

             ),
              

            Container(
              margin: EdgeInsets.only(top: 20),
              
              height: 100,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              alignment: Alignment.center,
              child: Text('Mens sweater: 4', textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20)),
            ),
            Container(
            
              margin: EdgeInsets.only(top: 20),
              
              height: 100,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              alignment: Alignment.center,
              child: Text('Sandle: 4', textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 20),)
              
            ),
            
          ],

        )
      ),
    );
}

void choiceAction(String choice){
  print('working');
}




}