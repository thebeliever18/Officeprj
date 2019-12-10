// import 'package:flutter/material.dart';

// void main() => runApp(MaterialApp(home: Conv()));

// class Conv extends StatefulWidget {
//   @override
//   _ConvState createState() => _ConvState();
// }

// class _ConvState extends State<Conv> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(s
//         appBar: AppBar(
//           title: Text("Comment"),
//         ),
//         body:
//             Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
//           TextField(
//               decoration: InputDecoration(
//             hintText: "Write something",
//             suffixIcon: Stack(children: <Widget>[
//               Container(
//                 height: 45,
//                 width: 45,
//                 child: Material(
//                   borderRadius: BorderRadius.circular(400),
//                   color: Colors.grey[100],
//                   elevation: 5.0,
//                 ),
//               ),
//               Positioned(
//                 bottom: 2,
//                 child: IconButton(
//                   icon: Icon(
//                     Icons.send,
//                     color: Colors.black,
//                     size: 28,
//                   ),
//                   onPressed: () {},
//                 ),
//               )
//             ]),
//           )),
//         ]));
//   }
// }


// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
    
//       home: Scaffold(
        
//         body: Center(
//           child: Container(
          
//             height: 80,
//             width: 280,
//             child: Card(
            
            
//               color: Color.fromRGBO(220, 20, 60, 1,),
//               child: Column(
                
//                 mainAxisAlignment: MainAxisAlignment.center,
              
//                 children: <Widget>[
//                   Row(
//                     children: <Widget>[
//                       SizedBox(width: 5,),
//                       Text(
//                         "Name:",
//                         style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
                      
//                     ],
//                   ),
//                   SizedBox(height: 3,),
//                   Row(
                    
//                     children: <Widget>[
//                       SizedBox(width:5),
//                       Text(
//                         "Comment",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 25,
                          
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 3,),
//                   Row(
                    
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       Text(
                        
//                         "Time:",
//                         style: TextStyle(
//                           color: Colors.green[200],

//                           fontSize: 10,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(width: 15,)
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
