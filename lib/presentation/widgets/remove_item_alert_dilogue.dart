import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemoveItemDialog extends StatelessWidget {
  final VoidCallback onRemove;

  RemoveItemDialog({required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Remove Item',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 5.sp),
      ),
      content: Text(
        'Are you sure you want to remove this item from your cart?',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w600, fontSize: 4.sp),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('Remove'),
          onPressed: () {
            onRemove();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
