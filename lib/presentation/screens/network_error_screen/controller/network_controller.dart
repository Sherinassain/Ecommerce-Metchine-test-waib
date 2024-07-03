import 'package:ecommerce/core/constants/color.dart';
import 'package:ecommerce/core/utiles/app_utils.dart';
import 'package:ecommerce/presentation/screens/splash_screen/view/splash_screen.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController{
    checkNetwork() async {
    if (await AppUtils.isOnline()) {
      Get.offAll(SplashScreen());
    } else {
      AppUtils.oneTimeSnackBar('No internet connection!',
          bgColor: ColorConst.green3D);
    }
  }
}