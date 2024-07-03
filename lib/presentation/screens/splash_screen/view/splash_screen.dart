import 'package:ecommerce/core/constants/color.dart';
import 'package:ecommerce/core/constants/image.dart';
import 'package:ecommerce/core/constants/textstyle.dart';
import 'package:ecommerce/presentation/screens/splash_screen/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashCtrl = Get.put(SplashController());

  @override
  void initState() {
    splashCtrl.checkConnectivity(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.asset(
          'assets/images/splash_animation.json',
          width: 300,
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
