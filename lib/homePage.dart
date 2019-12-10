import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:office_prj/Userprofile.dart';
import 'package:office_prj/loginPage.dart';
import 'package:http/http.dart' as http;
import 'package:office_prj/orderdetail.dart';
import 'package:office_prj/otpPage.dart' as prefix0;

import 'dart:convert';
import 'dart:async';

import 'package:office_prj/post.dart';
import 'package:office_prj/userprofile.dart' as prefix1;

class Nextpage extends StatelessWidget {
  @override
  String accessToken;
  Nextpage(this.accessToken);
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new HomePage(this.accessToken),
    );
  }
}

List<String> notes = [
  "fluttermaster.com",
  "Update Android Studio to 3.3",
  "Implement ListView widget",
  "Demo ListView simplenote app",
  "Fixing app color",
  "Create new note screen",
  "Persist notes data",
  "Add screen transition animation",
  "Something long Something long Something long Something long Something long Something long",
];

class HomePage extends StatefulWidget {
  String accessToken;

  HomePage(this.accessToken);
  @override
  State createState() => new HomePageState(this.accessToken);
}

class Constants {
  static const String Settings = 'Settings';
  static const String More = 'More...';
  static const String SignOut = 'Sign Out';
  static const String Report = 'Report us';

  static const List<String> choices = <String>[Settings, More, SignOut, Report];
}

var a;
var b;
int len;

class HomePageState extends State<HomePage> {
  Map data;
  List userData;
  String accessToken;
  HomePageState(this.accessToken);



  Future getData() async {
    Map<String, String> headers = {"Authorization": "Bearer $accessToken"};
    print("header is $headers");
    http.Response response = await http.get(
        "http://test.dsewa.com.np/api/android/get-order/customer",
        headers: headers);
    data = json.decode(response.body);

    

    setState(() {
      userData = data["data"];
    });
    print(userData);
  }
 
  

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Container(
            child: Column(
              children: <Widget>[],
            ),
          ),
          title: const Text("dSewa"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {
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
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
                child: InkWell(
                    onTap: () {
                      String sendOrderId=userData[index]["order_id"].toString();
                      String sendProduct= userData[index]["product_type"][0].toString();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            
                            builder: (context) => Orderdetail(sendOrderId, sendProduct, accessToken)),
                      );
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10, left: 16, right: 16.0),
                        child: Container(
                          height: 120,
                            margin: EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 5.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[100]),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                   SizedBox(
                                        height: 10,
                                        width: 10,
                                      ),

                                  Row(
                                    children: <Widget>[
                                      Text(
                                        " ${userData[index]["product_type"][0]}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 35,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                        width: 140,
                                      ),
                                    
                                      
                                         
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "Rs:",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "  ${userData[index]["cod"]}",style: TextStyle(fontSize: 13),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children:<Widget>[
                                  Row(children: <Widget>[
                                    Text("    From:",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        )),
                                        
                                        
                                    Text(
                                      " ${userData[index]["vendor"]}",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                     SizedBox(
                                    width: 3,
                                  ),
                                  ]),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(children: <Widget>[
                                    Text("    Tracking Id:",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(" ${userData[index]["tracking_id"]}",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          backgroundColor: Colors.grey[200],
                                        )),
                                  ]),
                                    ]),
                                  
                                  // Row(
                                  //   crossAxisAlignment: CrossAxisAlignment.start,
                                  //   children: <Widget>[
                                  //     Column(
                                  //       children: <Widget>[
                                  //         Text(
                                  //           "Pickup Hub:",
                                  //           style: TextStyle(
                                  //             fontWeight: FontWeight.bold,
                                  //             fontSize: 20,
                                  //             color: Colors.black,
                                  //           ),
                                  //         ),
                                  //         SizedBox(height: 5),
                                  //         Text(
                                  //             "Phone 1: ${userData[index]["pickup_hub"]["phone1"]}"),
                                  //         Text(
                                  //             "Phone 2: ${userData[index]["pickup_hub"]["phone2"]}"),
                                  //       ],
                                  //     ),
                                  //     prefix0.sizewidth(50),
                                  //     //Text(" Hub Id: ${userData[index]["hub_id"]}"),
                                  //     //Text(" Sender Id: ${userData[index]["sender_id"]}"),
                                  //     Column(
                                  //       children: <Widget>[
                                  //         Text(
                                  //           "Vendor Contact:",
                                  //           style: TextStyle(
                                  //             fontWeight: FontWeight.bold,
                                  //             fontSize: 20,
                                  //             color: Colors.black,
                                  //           ),
                                  //         ),
                                  //         SizedBox(
                                  //           height: 5,
                                  //         ),
                                  //         Text(
                                  //             "Phone 1: ${userData[index]["vendor_contact"]["phone1"]}"),
                                  //         Text(
                                  //             "Phone 2: ${userData[index]["vendor_contact"]["phone2"]}"),
                                  //       ],
                                  //     ),
                                  //   ],
                                  // ),

                                  //       Column(
                                  //         crossAxisAlignment: CrossAxisAlignment.center,
                                  //         children:<Widget>[
                                  //       Text(
                                  //         "Delivery hub:",
                                  //         style: TextStyle(
                                  //           fontWeight: FontWeight.bold,
                                  //           fontSize: 20,
                                  //           color: Colors.black,
                                  //         ),
                                  //       ),
                                  //       SizedBox(
                                  //         height: 5,
                                  //       ),

                                  //       Text(
                                  //           "${userData[index]["delivery_hub"]["phone1"]}"),
                                  //       Text(
                                  //           "${userData[index]["delivery_hub"]["phone2"]}"),
                                  //     ]
                                  // )
                                ])))));
          },
          itemCount: userData == null ? 0 : userData.length,
        ));
  }

  void choiceAction(String choice) {
    print('working');
  }

  // remove(index) {
  //   userData[index]["product_type"].toString().substring(1);
  //   userData[index]["product_type"].toString().length;
  //   userData[index]["product_type"].toString().substring(a);
  // }
}
