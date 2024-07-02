import 'package:ecommerce/core/utiles/app_screen_util.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonIcon;
  final String buttonText;
  final double buttonTextSize;
  const CustomButton({super.key,required this.buttonColor,required this.buttonIcon,required this.buttonText,required this.buttonTextSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: AppScreenUtil().screenHeight(20),
      // width: AppScreenUtil().screenWidth(80),
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppScreenUtil().screenHeight(5),
            horizontal: AppScreenUtil().screenWidth(5)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageIcon(
              AssetImage(
                buttonIcon,
              ),
              // size: AppScreenUtil().screenWidth(26),
              color: Colors.white,
            ),
            SizedBox(
              width: AppScreenUtil().screenWidth(2),
            ),
            Text(
              buttonText,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: buttonTextSize),
            )
          ],
        ),
      ),
    );
  }
}
