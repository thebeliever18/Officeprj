import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

class HomePageState extends State<HomePage>{
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: <Widget>[
            Text('welcome to the homepage', textAlign: TextAlign.center,)
          ],

        )

       
        
      ),
    );
}
}