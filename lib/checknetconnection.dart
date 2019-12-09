import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:office_prj/errorPage.dart';
import 'package:office_prj/loginPage.dart';
import 'package:office_prj/otpPage.dart';

Future<void> checkInternetConnectivity(int a, context) async {
  print("debug $a");
  var connectivityResult = await (Connectivity().checkConnectivity());

  /**
               * Importing otpPage
               */
  if (a == 1 &&
      ((connectivityResult == ConnectivityResult.mobile) ||
          (connectivityResult == ConnectivityResult.wifi))) {
            print("hhhhh");
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return OtpPage();
    }));
    /**
               * Importing Login Page
               */
  } else if (a == 0 &&
      ((connectivityResult == ConnectivityResult.mobile) ||
          (connectivityResult == ConnectivityResult.wifi))) {
            print("ooo");
    a = 0;
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginPage();
    }));
  } else if (connectivityResult == ConnectivityResult.none) {
    print("none");
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return NetPage();
    }));
  }
}
