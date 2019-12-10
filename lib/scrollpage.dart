// import 'package:flutter/material.dart';

// void main() {
//   List<String> notes = [
//     "fluttermaster.com",
//     "Update Android Studio to 3.3",
//     "Implement ListView widget",
//     "Demo ListView simplenote app",
//     "Fixing app color",
//     "Create new note screen",
//     "Persist notes data",
//     "Add screen transition animation",
//     "Something long Something long Something long Something long Something long Something long",
//   ];

//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         actions: <Widget>[
//           Text("ID"),
//         ],
//         // backgroundColor: Colors.white,

//         title: Text("Baby Clothes"),
//       ),
//       body: Container(color: Colors.white10, child: HomePage(notes)),
//     ),
//   ));
// }

// class HomePage extends StatelessWidget {
//   final List<String> notes;

//   HomePage(this.notes);

//   @override
//   Widget build(BuildContext context) {
//     //TODO build ListView here
//     return ListView.builder(
//         itemCount: notes.length,
//         itemBuilder: (context, pos) {
//           return Card(
//               child: Row(children: <Widget>[
//             Column(
//               children: <Widget>[
//                 Text(
//                   '05:04',
//                   style: TextStyle(fontSize: 30.0, height: 1.0),
//                 ),
                
//                 Text(
//                   'September',
//                   style: TextStyle(fontSize: 15.0, height: 1.0),
//                 ),
//                 Text(
//                   'Sunday',
//                   style: TextStyle(fontSize: 22.0, height: 1.7),
//                 )
//               ],
//             ),
//             Container(
//               width: 30,
//             ),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Text(
//                   'Delivery Officer on the way',
//                   style: TextStyle(fontSize: 20.0, height: 1.0),
//                 ),
//                 Center(
//                   child: Container(
//                     margin: EdgeInsets.only(right: 150),
//                     child: Row(
                      
//                       children:<Widget>[
//                         Icon(
//                                     Icons.location_on,
//                                     color: Colors.red,
//                                   ),
//                         Text("Kathmandu")
//                       ] 
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             // Column(
//             //         children: <Widget>[
//             //           Container(
                        
//             //             color: Colors.blue,
//             //             child: Row(
                          
                          
//             //               children: <Widget>[
//             //                 Icon(
//             //                   Icons.location_on,
//             //                   color: Colors.red,
//             //                 ),
//             //                 Text("Kathmandu")
//             //               ],
//             //             ),
//             //           ),
//             //         ],
//             //       ),
//           ]));

//           //  child: Card(
//           //   color: Colors.white,
//           //   child: Padding(
//           //     padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
//           //     child: Text(notes[pos], style: TextStyle(
//           //       fontSize: 18.0,
//           //       height: 1.6,
//           //     ),),
//         });
//   }
// }
