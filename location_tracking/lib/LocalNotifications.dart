// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// class LocalNotification extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
    
//     return LocalNotificationState();
//   }
// }

// class LocalNotificationState extends State<LocalNotification>{
//   final notifications=FlutterLocalNotificationsPlugin();
//   @override
  
//   void initState() { 
//     super.initState();

//     //android settings
//     final initializationSettingsAndroid =
//     new AndroidInitializationSettings('flutter');

//     //iOS settings
//     dynamic initializationSettingsIOS; //= new IOSInitializationSettings(
//     //onDidReceiveLocalNotification: onSelectNotification);

//     var initializationSettings = new InitializationSettings(
//     initializationSettingsAndroid,initializationSettingsIOS);

//     notifications.initialize(initializationSettings,
//     onSelectNotification: onSelectNotification);
    
//   }

//   Future onSelectNotification(String payload) async => await Navigator.push(
//     context, 
//     MaterialPageRoute(builder:(context)=>SecondPage(payload:payload)));
//   @override
//   Widget build(BuildContext context) {
    
//     return null;
//   }
  
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notificationn extends StatefulWidget{
  String response;
  Notificationn(this.response);
  @override
  State<Notificationn> createState() => NotificationState(this.response);
  }

class NotificationState extends State<Notificationn>{
  String response;
  NotificationState(this.response);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SnackBar(
          content: Text(response),
        ),
      ),
    );
  }

}