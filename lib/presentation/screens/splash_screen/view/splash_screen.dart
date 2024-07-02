import 'package:ecommerce/core/constants/image.dart';
import 'package:ecommerce/core/constants/textstyle.dart';
import 'package:ecommerce/presentation/screens/splash_screen/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
    final splashCtrl = Get.put(SplashController());

   @override
  void initState() {
    splashCtrl.checkConnectivity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child:Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
  Padding(
    padding: const EdgeInsets.all(40),
    child: Image.asset(ImageCons.splashPath,),
  ),
  const SizedBox(height: 10,),
  Text(
            "E-commerce",
            style: TextStyleClass.poppinsMedium(
              size: 10.sp,
              color: Colors.blueAccent,
            ),)
],
      ))
    );
  }
}
