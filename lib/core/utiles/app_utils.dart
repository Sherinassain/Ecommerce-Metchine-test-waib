

import 'package:ecommerce/core/config/session.dart';
import 'package:ecommerce/core/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';


import '../../../main.dart';
// import '../../routes.dart';

class AppUtils {
  ///use to print any data for testing and later will be useful to remove the print inside this
  printError(data) {
    print('============Error===============');
    print(data);
    print('============Error===============');
  }

  printData(data, {String info = 'DATA'}) {
    print('============$info===============');
    print(data);
    print('============$info===============');
  }


  tapWithNetworkCheckn(Function() function) {
    if (true) {
      function();
    }
  }


  ///to log data for debugging
  static Logger logger = Logger();



  clearSnackBar() {
    ScaffoldMessenger.of(Get.context!).clearSnackBars();
  }

  // static NumberFormat formatter = NumberFormat('#,##,000');
  static snackBar(
    String? message, {
    int time = 2,
    Color? bgColor,
    TextStyle? textStyle,
    BuildContext? context,
    bool showOnTop = false,
  }) {
    // ScaffoldMessenger.of(Get.context!).clearSnackBars();///To CLEAR PREVIOUS SNACK BARS
    return ScaffoldMessenger.of(context ?? Get.context!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: bgColor ?? Colors.blue,
        content: Text(message!, style: textStyle),
        duration: Duration(seconds: time),
        margin: showOnTop
            ? EdgeInsets.only(
                bottom:
                    MediaQuery.of(context ?? Get.context!).size.height - 100,
                right: 20,
                left: 20)
            : null,
      ),
    );
  }

  static tapWithNetworkCheck(Function() function) async {
    if (await AppUtils.isOnline()) {
      function;
    }
  }

  static oneTimeSnackBar(
    String? message, {
    int time = 2,
    Color? bgColor,
    TextStyle? textStyle,
    BuildContext? context,
    bool showOnTop = false,
  }) {
    ScaffoldMessenger.of(Get.context!).clearSnackBars();

    ///To CLEAR PREVIOUS SNACK BARS
    return ScaffoldMessenger.of(context ?? Get.context!)
        // ScaffoldMessenger.of(context??Get.context!)
        .showSnackBar(
      SnackBar(
        /*action:SnackBarAction(label: "Ok",
        onPressed: (){
          SystemSettings.internalStorage();
        },
        ) ,*/

        behavior: showOnTop ? SnackBarBehavior.floating : null,
        backgroundColor: bgColor ?? ColorConst.appColor,
        content: Text(message!, style: textStyle),
        duration: Duration(seconds: time),
        margin: showOnTop
            ? EdgeInsets.only(
                bottom:
                    MediaQuery.of(context ?? Get.context!).size.height - 100,
                right: 20,
                left: 20)
            : null,
      ),
    );
  }



  static bool validationOfEmail(String emailPassed) {
    var email = emailPassed;
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  static bool validationOfName(String namePassed) {
    var name = namePassed;
    bool nameValid = RegExp(r"^[a-zA-Z ][a-zA-Z ]+[a-zA-Z ]$").hasMatch(name);
    return nameValid;
  }

  static bool validationOfPIN(String passedPIN) {
    var pin = passedPIN;
    bool isValid = RegExp(r"^[1-9]{1}\d{2}\s?\d{3}$").hasMatch(pin);
    return isValid;
  }

  static bool validationOfPhone(String passedPhone) {
    var phone = passedPhone;
    bool isValid = RegExp(r"^[0-9]{10,10}").hasMatch(phone);
    return isValid;
  }

  ///Used to check internet connectivity with package => internet_connection_checker: ^0.0.1+3
  ///user this on every btn / or can be implemented on service before API call
  static Future<bool> isOnline() async {
    bool isOnline = await InternetConnectionChecker().hasConnection;
    if (isOnline) {
      return true;
    } else {
      oneTimeSnackBar('No network connection!', bgColor: ColorConst.green3D);
      return false;
    }
  }



 

  static getAccessToken() {
    return GetStorage().read(Session.authToken) ?? '';
  }

  static getId() {
    return GetStorage().read(Session.id) ?? '';
  }

}

class AppUtilDynamicSize {
  late BuildContext context;
  double screenHeight = 0;
  double screenWidth = 0;
  double height10 = 0;
  double width10 = 0;
  double width1 = 0;
  double blockSizeVertical = 0;
  double blockSizeHorizontal = 0;
  double uiWidth = 375;
  double uiHeight = 812;
  double textScaleFactor = 0;
  double ratioWidth1 = 0;
  double ratioHeight1 = 0;
  AppUtilDynamicSize(this.context) {
    this.screenHeight = MediaQuery.of(context).size.height < 600
        ? 600
        : MediaQuery.of(context).size.height;
    this.screenWidth = MediaQuery.of(context).size.width;
    this.height10 = screenHeight / (812 / 10); //use this only
    this.width10 = screenWidth / (375 / 10); //use this only
    this.width1 = screenWidth / (375 / 1);
    // print("width: $screenWidth");
    // print("height: $screenHeight");
    this.blockSizeVertical = MediaQuery.of(context).size.height / 100;
    this.blockSizeHorizontal = MediaQuery.of(context).size.width / 100;
    this.textScaleFactor = screenWidth / uiWidth;
    // print("blockSizeHorizontal : $blockSizeHorizontal");
    this.ratioWidth1 = (1 / uiWidth) * screenWidth;
    this.ratioHeight1 = (1 / uiHeight) * screenHeight;
    // print("ratioWidth10: $ratioWidth1");
    // print("ratioHeight10: $ratioHeight1");
  }
}


