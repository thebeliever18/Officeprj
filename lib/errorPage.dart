import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(home: HamroApp()));
class HamroApp extends StatefulWidget {
  @override
  _DsewaState createState() => _DsewaState();
}

class _DsewaState extends State<HamroApp> {
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Container(
        padding: EdgeInsets.only(left: 85,bottom: 10),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: <Widget>[
            Text("Opps!",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,), ),
            Text("No internet connection!\nCheck your connection",style: TextStyle(fontSize: 20),),
          
            Container(
              margin: EdgeInsets.only(top: 30),
              child: RaisedButton(onPressed: (){},child: Text("Try Again",style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white)
              
                ),color: Color.fromARGB(255, 0, 56, 147),),
            )
            
          ],
        ),
      ),
      
    );
  }
}