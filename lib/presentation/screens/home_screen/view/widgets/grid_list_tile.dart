import 'package:ecommerce/core/constants/textstyle.dart';
import 'package:ecommerce/core/utiles/app_screen_util.dart';
import 'package:ecommerce/presentation/screens/home_screen/controller/home_controller.dart';
import 'package:ecommerce/presentation/screens/view_bag_screen/controller/cart_controller.dart';
import 'package:ecommerce/presentation/widgets/common_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class GridListTile extends StatelessWidget {
  final String? title;
  final String? price;
  final String? image;
  final String? description;
  final int index;

  GridListTile(
      {super.key,
      required this.title,
      required this.price,
      required this.image,
      required this.index,
      required this.description});
  final homeCtrl = Get.put(HomeController());
  final cartCtrl = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppScreenUtil().screenHeight(8)),
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100.h,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.r)),
              child:
              //  Image.network(
              //   image.toString(),
              //   loadingBuilder: (BuildContext context, Widget child,
              //       ImageChunkEvent? loadingProgress) {
              //     if (loadingProgress == null) {
              //       return child;
              //     }
              //     return Center(
              //       child: CircularProgressIndicator(
              //         value: loadingProgress.expectedTotalBytes != null
              //             ? loadingProgress.cumulativeBytesLoaded /
              //                 (loadingProgress.expectedTotalBytes ?? 1)
              //             : null,
              //       ),
              //     );
              //   },
              //   errorBuilder: (BuildContext context, Object exception,
              //       StackTrace? stackTrace) {
              //     return Text('Failed to load image');
              //   },
              // ),
               CommonImageView(
                url: image.toString(),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: double.infinity,
              color: Colors.transparent,
              child: Text(
                title.toString(),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              '\$${price}',
              style: TextStyleClass.poppinsMedium(size: 15.00),
            ),
            const Spacer(),
            // SizedBox(
            //   height: 10.h,
            // ),
            InkWell(
              onTap: () {
                cartCtrl.addItem(homeCtrl.productList[index]);
              },
              child: Container(
                padding: EdgeInsets.all(5.r),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.r)),
                child: const Center(child: Text('Add to Bag')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
