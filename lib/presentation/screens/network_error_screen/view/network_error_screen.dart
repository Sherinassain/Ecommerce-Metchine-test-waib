import 'package:ecommerce/core/constants/color.dart';
import 'package:ecommerce/core/constants/image.dart';
import 'package:ecommerce/core/constants/textstyle.dart';
import 'package:ecommerce/core/utiles/app_utils.dart';
import 'package:ecommerce/presentation/screens/splash_screen/view/splash_screen.dart';
import 'package:ecommerce/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class NetworkErrorScreen extends StatefulWidget {
  const NetworkErrorScreen({super.key});

  @override
  State<NetworkErrorScreen> createState() => _NetworkErrorScreenState();
}

class _NetworkErrorScreenState extends State<NetworkErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Check your internet connection!",
              style: TextStyleClass.poppinsMedium(
                size: 5.sp,
                color: ColorConst.red,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async {
                if (await AppUtils.isOnline()) {
                  Get.offAll(const SplashScreen());
                } else {
                  AppUtils.oneTimeSnackBar('No internet connection!',
                      bgColor: ColorConst.green3D);
                }
              },
              child: CustomButton(
                  buttonColor: ColorConst.green3D,
                  buttonIcon: ImageCons.wifiIcon,
                  buttonText: 'Restart',
                  buttonTextSize: 3.sp),
            ),
          ],
        )));
  }
}
