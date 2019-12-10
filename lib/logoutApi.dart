import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

/*
 * After pressing logout button logout api is called
 */
class LogoutApi extends StatefulWidget {
  var getAccessToken;
  BuildContext context;
  LogoutApi(this.getAccessToken, this.context);
  @override
  State<StatefulWidget> createState() {
    return LogoutApiState(this.getAccessToken, this.context);
  }
}

class LogoutApiState extends State<LogoutApi> {
  var getAccessToken;
  BuildContext context;
  LogoutApiState(this.getAccessToken, this.context);
  @override
  void initState() {
    fetchLogoutApi(getAccessToken, context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

/*
 * Calling logout api 
 */
Future fetchLogoutApi(getAccessToken, context) async {
  try {
    String logOutUrl = "http://test.dsewa.com.np/api/logout";
    Map<String, String> headers = {"Authorization": "Bearer $getAccessToken"};
    http.Response response = await http.post(logOutUrl, headers: headers);
    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => LoginPage()),
      );
    }
  } catch (e) {
    /**
     * If no internet connection then socketException is thrown
     * Catch caughts the socket exception and a alert dialog box is popped up.
     */
    Navigator.of(context).pop();
    print("no net");
    showDialog(
      context: context,
      child: AlertDialog(
        title: Text("No Internet Connected"),
        content: Text("Please turn on wifi or mobile data"),
      )
    );
  }
}
