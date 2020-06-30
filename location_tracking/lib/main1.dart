// import 'dart:collection';
// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:flutter/services.dart';
// import 'main.dart';
// import 'package:androidstd_geofencing/LocalNotifications.dart';
// import 'mapUI.dart';

// String response;
// const platform = const MethodChannel('flutter.native/helper');
// const EventChannel eventchannel = const EventChannel('second');
// Stream<String> value;

// // Future<void> replymesg() async{
// //     value=eventchannel.receiveBroadcastStream().map<String>((value)=>value);
// //     print(value);
// // } 27.670094488858734, 85.3616489097476

// Future<void> initPlatformState(l, lg, ok, geofenceTransition) async {
//   try {
//     if (ok == "ok") {
//       final String result = await platform.invokeMethod(
//           'geofence', <String, dynamic>{
//         't': l,
//         'r': lg,
//         'check': ok,
//         'geofenceTransition': geofenceTransition
//       });
//       response = result;
//     }
//   } on PlatformException catch (e) {
//     response = "Exception $e";
//   }

//   response = response;
//   print("Response is" + response);

//   if (response == "You have entered in the geofence") {
//     try {
//       final String result = await platform.invokeMethod('exitGeofence');
//       response = result;
//     } on PlatformException catch (e) {
//       response = "Exception $e";
//     }
//     response = response;
//     print("Response is" + response);
//   }

//   var contextt;

//   Notificationn(response);
   
//   Alertbox(contextt, response);
// }
