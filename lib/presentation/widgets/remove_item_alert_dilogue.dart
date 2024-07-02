import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomItemDialog extends StatelessWidget {
  final VoidCallback onRemove;
  final String title;
  final String subTitle;
  final String buttonText1;
  final String buttonText2;

  CustomItemDialog({required this.onRemove,required this.buttonText1,required this.buttonText2,required this.subTitle,required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 5.sp),
      ),
      content: Text(
        subTitle,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w600, fontSize: 4.sp),
      ),
      actions: <Widget>[
        TextButton(
          child:  Text(buttonText1),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child:  Text(buttonText2),
          onPressed: () {
            onRemove();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
