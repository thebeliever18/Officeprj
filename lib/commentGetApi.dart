import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:office_prj/commentPostApi.dart';

/*
 * Getting comment from api
 */
class CommentApi extends StatefulWidget {
  String getOrderId, getAccessToken;
  bool triggerAgain;
  CommentApi([this.getOrderId, this.getAccessToken, this.triggerAgain]);

  @override
  State<StatefulWidget> createState() {
    return CommentApiState(
        this.getOrderId, this.getAccessToken, this.triggerAgain);
  }
}

class CommentApiState extends State<CommentApi> {
  String getOrderId, getAccessToken;
  /*
   * @triggerAgain if send button is pressed
   */
  bool triggerAgain;
  CommentApiState([this.getOrderId, this.getAccessToken, this.triggerAgain]);

  List getChatData;

  /* 
   * @indicator for displaying either circular progress indicator or comment
   */
  bool indicator;

  Future gett;

  var comment = TextEditingController();

  @override
  void initState() {
    if (triggerAgain == false) {
      indicator = true;
      gett = getCommentApi(getAccessToken, getOrderId);
      super.initState();
    } else if (triggerAgain == true) {
      indicator = false;
      gett = getCommentApi(getAccessToken, getOrderId);
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Comments"),
          backgroundColor: Colors.blue[900],
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
        ),
        /**
       * If indicator is true circular progress indicator is displayed
       */
        body: indicator
            ? Center(
                child: CircularProgressIndicator(),
              )
            /**
                * If indicator is false comment UI is displayed
                */
            : Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 80,
                            width: 280,
                            child: Card(
                              color: Color.fromRGBO(
                                1,
                                171,
                                255,
                                1,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        /**
                                         * Extracting username from api
                                         */
                                        "${getChatData[index]['user_name']} :",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 5),
                                      Text(
                                        /**
                                         * Extracting comment from api
                                         */
                                        getChatData[index]['comment'],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        getChatData[index]['date'],
                                        style: TextStyle(
                                          color: Colors.green[200],
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount:
                            getChatData == null ? 0 : getChatData.length),
                  ),
                  Positioned(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextField(
                          controller: comment,
                          maxLength: 50,
                          maxLengthEnforced: true,
                          decoration: InputDecoration(
                            counterText: '',
                            hintText: "Write comment...",
                            suffixIcon: Stack(children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 45,
                                width: 45,
                                child: Material(
                                  borderRadius: BorderRadius.circular(400),
                                  color: Colors.grey[100],
                                  elevation: 0.5,
                                ),
                              ),
                              Positioned(
                                bottom: 2,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.send,
                                    color: Colors.black,
                                    size: 28,
                                  ),
                                  onPressed: () {
                                    /**
                                     * Calling method for Api of comment section
                                     */
                                    postApiComment(getAccessToken, comment,
                                        getOrderId, context);
                                  },
                                ),
                              )
                            ]),
                          )),
                      // Card(),
                      // Container(
                      //   child: TextFormField(
                      //     controller: comment,
                      //     cursorColor: Colors.black,
                      //     decoration: InputDecoration(
                      //         suffixIcon: IconButton(
                      //       onPressed: () {
                      //         postApiComment(getAccessToken, comment, getOrderId,context);
                      //       },
                      //       icon: Icon(
                      //         Icons.send,
                      //         size: 40,
                      //         color: Colors.green,
                      //       ),
                      //     )),
                      //   ),
                      //   color: Colors.white,
                      // ),
                    ],
                  ))
                ],
              ));
  }

  /*
   * Extracting data by calling comment api
   */
  Future getCommentApi(getAccessToken, getOrderId) async {
    var data;
    Map<String, String> headers = {"Authorization": "Bearer $getAccessToken"};
    print("header is $headers");
    http.Response response = await http.get(
        "http://test.dsewa.com.np/api/android/get-order-comment/$getOrderId",
        headers: headers);
    data = json.decode(response.body);
    //print(getChatData.length);
    // getChatData = data["data"];
    // print(getChatData);
    setState(() {
      indicator = false;
      getChatData = data['data'];
    });
    // print(data['data'].length);
    // for (var i = 0; i < data.le(); i++) {

    // }
    // print(data['data']);
    // print(data['data'][0]['comment']);
    // print(data['data'][1]['comment']);
    // print(data['data'][2]['comment']);
    //print(data['data']['AmtTobeReceived']);
  }
}
