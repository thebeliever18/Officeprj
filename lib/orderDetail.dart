import 'package:flutter/material.dart';
import 'package:office_prj/commentGetApi.dart';
import 'package:office_prj/errorPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:office_prj/homePage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'dart:async';

// List<String> notes = [
//   "fluttermaster.com",
//   "Update Android Studio to 3.3",
//   "Implement ListView widget",
//   "Demo ListView simplenote app",
//   "Fixing app color",
//   "Create new note screen",
//   "Persist notes data",
//   "Add screen transition animation",
//   "Something long Something long Something long Something long Something long Something long",

// ];

final String phone = 'tel:+9779851225639';

/*
 * After pressing call button in orderDetail page then in the call log keypad of the phone the @phone is displayed
 */
_callPhone() async {
  if (await canLaunch(phone)) {
    await launch(phone);
  } else {
    throw 'Could not Call Phone';
  }
}

class Orderdetail extends StatefulWidget {
  //final List<String> notes;

  Map data;
  List orderData;
  List log;
  String getOrderId;
  String getProduct;
  String accessToken;
  Orderdetail(this.getOrderId, this.getProduct, this.accessToken);
  @override
  State<StatefulWidget> createState() {
    return OrderdetailState(this.getOrderId, this.getProduct, this.accessToken);
  }
}

class OrderdetailState extends State<Orderdetail> {
  List orderData;
  Map data;
  List log;
  String getOrderId;
  String getProduct;
  String accessToken;
  OrderdetailState(this.getOrderId, this.getProduct, this.accessToken);

  Future getOrderdetail() async {
    try {
      Map<String, String> headers = {"Authorization": "Bearer $accessToken"};
      print("header is $headers");
      http.Response response = await http.get(
          "http://test.dsewa.com.np/api/android/get-order-log/$getOrderId",
          headers: headers);
      data = json.decode(response.body);
      setState(() {
        orderData = data["data"]["log"];
      });
    } catch (e) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NetPage()));
    }
    print(orderData);
  }

  @override
  void initState() {
    super.initState();
    getOrderdetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 23, right: 20),
              child: Text(
                "Order id: $getOrderId",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.0, height: 1.0),
              ),
            ),
          ],
          backgroundColor: Colors.blue[900],
          title: Text(
            "$getProduct",
            style: TextStyle(fontSize: 28),
          ),
        ),
        bottomNavigationBar: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.info_outline),
              iconSize: 30,
            ),
            Container(
              margin: EdgeInsets.only(left: 40.0),
              child: Row(children: <Widget>[
                IconButton(
                  onPressed: () {
                    _callPhone();
                  },
                  icon: Icon(Icons.phone),
                  iconSize: 30,
                  //  iconSize: 50,
                ),
                Text("Customer Support"),
              ]),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0),
              child: Row(children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CommentApi(getOrderId, accessToken, false)));
                  },
                  icon: Icon(Icons.message),
                  iconSize: 30,
                  //  iconSize: 50,
                ),
                Text("Comment"),
              ]),
            ),
          ],
        ),
        body: ListView.builder(
          // itemCount: notes.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
                child: Row(children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    '${orderData[index]["date"]} ',
                    style: TextStyle(fontSize: 15.0, height: 1.5),
                  ),
                  Text(
                    'day:',
                    style: TextStyle(fontSize: 15.0, height: 1.7),
                  )
                ],
              ),
              Container(
                width: 30,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${orderData[index]["message"]}',
                    style: TextStyle(fontSize: 20.0, height: 1.7),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 50),
                    child: Row(children: <Widget>[
                      // SizedBox(width: 50,),
                      Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 12,
                      ),
                      Text(
                        '${orderData[index]["location"]}',
                        style: TextStyle(height: 1.7),
                      ),
                    ]),
                  ),
                ],
              ),

              // Column(
              //         children: <Widget>[
              //           Container(

              //             color: Colors.blue,
              //             child: Row(

              //               children: <Widget>[
              //                 Icon(
              //                   Icons.location_on,
              //                   color: Colors.red,
              //                 ),
              //                 Text("${orderData[index]["location"]}")
              //               ],
              //             ),
              //           ),
              //         ],
              //       ),
            ]));

            //  child: Card(
            //   color: Colors.white,
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
            //     child: Text(notes[pos], style: TextStyle(
            //       fontSize: 18.0,
            //       height: 1.6,
            //     ),),
          },
          itemCount: orderData == null ? 0 : orderData.length,
        ));
  }
}

// final List<String> notes;

// Map data;
// // List orderDetail;
// String getOrderId;
// String getProduct;
// String accessToken;
// Orderdetail(this.getOrderId,this.getProduct, this.accessToken);
