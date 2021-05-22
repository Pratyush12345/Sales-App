import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:pozitive/Core/AppConstact/appStyles.dart';
import 'package:toast/toast.dart';
import '../AppConstact/CustomToast.dart';
import 'appColors.dart';

class AppConstant {
  static showFialureDialogue(String message, BuildContext context) async {
    await showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(
              "Something went wrong",
              style: AppStyle.headerTextstyle,
            ),
            content: Text(
              message,
              style: AppStyle.smallRedTextStyle,
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  static String stringValidator(String value, String controllerName) {
    if (value.isEmpty) {
      return "Please enter $controllerName";
    }
    return null;
  }

  static Future checkConnectivity(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      showFialureDialogue('No Internet Connection', context);
    }
//    if (connectivityResult == ConnectivityResult.mobile) {
//      // I am connected to a mobile network.
//    } else if (connectivityResult == ConnectivityResult.wifi) {
//      // I am connected to a wifi network.
//    }
  }

  static showComfirmDialogue(
      {BuildContext mainContext, Function function}) async {
    await showDialog(
        context: mainContext,
        builder: (ctx) {
          return AlertDialog(
            title: Text(
              "Are you sure, you want to clear all data?",
              style: AppStyle.headerTextstyle,
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  function();
                  Navigator.of(mainContext).pop();
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.of(mainContext).pop();
                },
              )
            ],
          );
        });
  }

  static Widget circularProgressIndicator() {
    return Center(child: CircularProgressIndicator());
  }

  static void showSuccessToast(BuildContext context, String msg,
      {int duration, int gravity}) {
    Toast.show(msg, context,
        duration: 3, gravity: gravity, backgroundColor: Colors.green);
  }

  static void showSuccessToast2(BuildContext context, String msg,
      {int duration, int gravity}) {
    CustomToast.show(msg, context,
        duration: 3, gravity: gravity, backgroundColor: Colors.green);
  }

  static void showFailToast(BuildContext context, String msg,
      {int duration, int gravity}) {
    Toast.show(msg, context,
        duration: 3, gravity: gravity, backgroundColor: AppColors.red);
  }

  static void showSuccessToastAddProsp(BuildContext context, String msg,
      {int duration, int gravity}) {
    Toast.show(msg, context,
        duration: 3, gravity: gravity, backgroundColor: Colors.lightGreen);
  }

  static void showFailToastAddProsp(BuildContext context, String msg,
      {int duration, int gravity}) {
    Toast.show(msg, context,
        duration: 3, gravity: gravity, backgroundColor: AppColors.red);
  }

  static Future<void> popUp(BuildContext context, String msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          //  title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(msg),
                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> popUp2(
      BuildContext context, String msg, Function onTap) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          //  title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(msg),
                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: onTap,
            ),
          ],
        );
      },
    );
  }

  static void printWrapped(String text) {
    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }
}
