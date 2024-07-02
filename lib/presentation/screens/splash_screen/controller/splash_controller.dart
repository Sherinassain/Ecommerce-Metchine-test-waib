import 'package:ecommerce/core/constants/scale.dart';
import 'package:ecommerce/core/utiles/app_utils.dart';
import 'package:ecommerce/presentation/screens/network_error_screen/view/network_error_screen.dart';
import 'package:ecommerce/routes/index.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var isLoading = true.obs;
  bool isTapped = false;

  void checkConnectivity() async {
    isTapped = false;
    // update();
    await Future.delayed(Durations.s3);
    isTapped = true;
    update();
    await Future.delayed(Durations.s1);

    ///redirect to no internet screen if internet is not available
    if (await AppUtils.isOnline()) {
      Get.offNamed(routeName.homeScreen);
    } else {
      Get.to(const NetworkErrorScreen());
      // Get.to(NetworkErrorScreen());
    }
    super.onInit();
  }
}
