// import 'dart:async';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// //import 'package:flutter_google_places/flutter_google_places.dart';
// //import 'package:geocoder/geocoder.dart';
// //import "package:google_maps_webservice/places.dart";
// import 'main.dart';
// import 'main1.dart';

// var onc = true;
// var l;
// var lg;


// class Mapp extends StatefulWidget {
//   @override
//   State<Mapp> createState() => MapPageState();
// }

// class MapPageState extends State<Mapp> {
//   String ok = "ok"; //
//   String geofenceTransition = "";

//   MapPageState();

//   bool mapToogle = false;

//   var currentLocation;

//   void initState() {
//     super.initState();
//     Geolocator().getCurrentPosition().then((currLoc) {
//       setState(() {
//         currentLocation = currLoc;
//         mapToogle = true;
//       });
//     });
//     type = MapType.hybrid;
//     markers = Set.from([]);
//     print("Current location is $currentLocation");
//     print("bool val is $onc");
//     //print("bool val of once is $once");
//     //print("Response is $response");
//   }

//   Completer<GoogleMapController> _controller = Completer();
//   MapType type;
//   //   CameraPosition _kGooglePlex = CameraPosition(
//   //   target: LatLng(currentLocation.latitude, currentLocation.longitude),
//   //   zoom: 14.4746,
//   // );
//   Set<Marker> markers;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'Flutter Google Maps',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: Scaffold(
//           body: Stack(
//             children: <Widget>[
//               Container(
//                 height: MediaQuery.of(context).size.height - 80.0,
//                 width: double.infinity,
//                 child: mapToogle
//                     ? GoogleMap(
//                         markers: markers,
//                         mapType: type,
//                         onTap: (position) {
//                           l = position.latitude;
//                           lg = position.longitude;
//                           initPlatformState(l, lg, ok, geofenceTransition);
//                           print(position);

//                           Marker mk1 = Marker(
//                             markerId: MarkerId('1'),
//                             position: position,
//                           );
//                           setState(() {
//                             markers.add(mk1);
//                           });
//                           Alertbox(context, response).alertBox(context);
//                         },
//                         initialCameraPosition: CameraPosition(
//                           target: LatLng(currentLocation.latitude,
//                               currentLocation.longitude),
//                           zoom: 20.0,
//                         ),
//                         onMapCreated: (GoogleMapController controller) {
//                           _controller.complete(controller);
//                         },
//                       )
//                     : Center(child: Text("Loading please wait...")),
//               ),
//               Align(
//                 alignment: Alignment.bottomRight,
//                 child: Row(
//                   children: <Widget>[
//                     FloatingActionButton(
//                       heroTag: "btn0",
//                       onPressed: () {
//                         setState(() {
//                           type = type == MapType.normal
//                               ? MapType.hybrid
//                               : MapType.normal;
//                         });
//                       },
//                       child: Icon(Icons.map),
//                     ),
//                     FloatingActionButton(
//                       heroTag: "btn1",
//                       child: Icon(Icons.zoom_in),
//                       onPressed: () async {
//                         (await _controller.future)
//                             .animateCamera(CameraUpdate.zoomIn());
//                       },
//                     ),
//                     FloatingActionButton(
//                       heroTag: "btn2",
//                       // child: StreamBuilder(
//                       //   stream: replymesg,
//                       //   builder: (BuildContext context,AsyncSnapshot<String> snapshot){
//                       //     if(snapshot.hasData){
//                       //       return Text("Reply is ${snapshot.data}");
//                       //     }
//                       //     return Text("Nodata");
//                       //   },
//                       // ),

//                       onPressed: () async {
//                         // (await _controller.future)
//                         //     .animateCamera(CameraUpdate.zoomOut());
//                       },
//                     ),
//                     FloatingActionButton.extended(
                      
//                       heroTag: "btn3",
//                       // icon: Icon(Icons.location_on),
//                        label: Text("Find"),
//                       /////////////////
//                       onPressed: () async {
//                         // show input autocomplete with selected mode
//                         // then get the Prediction selected
//                         // Prediction p = await PlacesAutocomplete.show(
//                         // context: context, mode: Mode.overlay,apiKey: kGoogleApiKey);
//                         // //timedelay
//                         // Future.delayed(Duration(seconds: 10), () => displayPrediction(p));
//                         // displayPrediction(p);
//                       },
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ));
//   }
// }

// /////////////////////
// // var count=1;
// // Future displayPrediction(Prediction p) async {
// //     if (p != null) {
// //       PlacesDetailsResponse detail;
// //       try{
// //         detail = await _places.getDetailsByPlaceId(p.placeId);
// //         double lat = detail.result.geometry.location.lat;
// //         double lng = detail.result.geometry.location.lng;
// //         print("latitude is $lat");
// //         print("longitude is $lng");
// //         print(count);
// //       }catch(e){
// //         count=2;
// //         displayPrediction(p);

// //       }

// //       //var str = Future.delayed(Duration(seconds: 4), () => throw 'Cannot locate user order');
// //       //var placeId = p.placeId;

// //       //var address = await Geocoder.local.findAddressesFromQuery(p.description);
// //       //print(placeId);
// //       //print(address);

// //     }
// //   }
// ///////////////////

// class Alertbox {
//   String ok = "ko"; 
//   String geofenceTransition = "";
//   Alertbox(context, response);
//   alertBox(context) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             content: Text("response is $response"),
//           );
//         });
//   }
// }
