import 'dart:convert';
import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:office_prj/main.dart';

/*
 * Registration page api
 */
class RegistrationApi extends StatefulWidget {
  String email, password, phone, phone2, name;
  RegistrationApi(
      this.email, this.password, this.phone, this.phone2, this.name);
  @override
  State createState() => new RegistrationApiState(
      this.email, this.password, this.phone, this.phone2, this.name);
}

class RegistrationApiState extends State<RegistrationApi> {
  String email, password, phone, phone2, name;
  RegistrationApiState(
      this.email, this.password, this.phone, this.phone2, this.name);

  @override
  void initState() {
    super.initState();
    registrationApiPost(email, password, phone, phone2, name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
              SizedBox(
                width: 10,
              ),
              Text("Processing..."),
            ],
          ),
        ],
      ),
    );
  }

  /*
   * Calling registration page api
   */
  registrationApiPost(String email, String password, String phone,
      String phone2, String name) async {
    try {
      String url = "http://test.dsewa.com.np/api/customer/cregister";
      Map<String, String> body = {
        "email": email,
        "password": password,
        "phone": phone,
        "phone2": phone2,
        "name": name
      };

      http.Response response = await http.post(
        url,
        body: body,
      );

      if (response.statusCode == 200) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return LoginPage();
        }));
      } else {
        print(response.statusCode); //302 status code for same email..
        var responseJson = response.body;
        print(responseJson);
        // var title=responseJson["message];
        // var printResponse=responseJson['errors']['email'];
        Navigator.pop(context);
        /**
         * Alert dialog box is displayed if the user registeres with the email which is already registered
         */
        showDialog(
            context: context,
            child: AlertDialog(
              title: Text("Invalid Input"),
              content: Text(
                  "Already registered with same email/other invalid input"),
            ));
      }
    } catch (e) {
      /**
       * Catching socket exception
       * SocketException occurs when there is no internet connectivity
       */
      Navigator.pop(context);
      showDialog(
          context: context,
          child: AlertDialog(
            title: Text("No Internet"),
            content: Text("Internet connection is required"),
          ));
    }
  }
}
