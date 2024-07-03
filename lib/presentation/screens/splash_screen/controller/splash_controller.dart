import 'package:ecommerce/core/constants/scale.dart';
import 'package:ecommerce/core/utiles/app_utils.dart';
import 'package:ecommerce/presentation/screens/bottom_nav/view/bottom_navigation.dart';
import 'package:ecommerce/presentation/screens/network_error_screen/view/network_error_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var isLoading = true.obs;
  bool isTapped = false;

  void checkConnectivity(BuildContext context) async {
    isTapped = false;
    // update();

    await Future.delayed(Duration(seconds: 3));
    isTapped = true;
    update();
    await Future.delayed(Duration(seconds: 1));
    if (kIsWeb) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const BottomNav()),
      );
    } else {
      ///redirect to no internet screen if internet is not available
      if (await AppUtils.isOnline()) {
        Get.off(const BottomNav());
      } else {
        Get.to(const NetworkErrorScreen());
      }
    }
    super.onInit();
  }
}
