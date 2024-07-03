import 'package:ecommerce/core/constants/color.dart';
import 'package:ecommerce/core/constants/image.dart';
import 'package:ecommerce/core/constants/textstyle.dart';
import 'package:ecommerce/core/utiles/app_screen_util.dart';
import 'package:ecommerce/presentation/screens/view_bag_screen/controller/cart_controller.dart';
import 'package:ecommerce/presentation/widgets/common_image_view.dart';
import 'package:ecommerce/presentation/widgets/custom_button.dart';
import 'package:ecommerce/presentation/widgets/remove_item_alert_dilogue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ViewBagLayout extends StatelessWidget {
  final String? title;
  final String? qty;
  final String? image;
  final String? price;

  final int index;

  ViewBagLayout({
    super.key,
    required this.title,
    required this.qty,
    required this.image,
    required this.price,
    required this.index,
  });
  // final homeCtrl = Get.put(HomeController());
  final cartCtrl = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppScreenUtil().screenWidth(5)),
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(10.r)),
        child: Padding(
          padding: EdgeInsets.all(AppScreenUtil().screenWidth(6)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100.h,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10.r)),
                child: CommonImageView(
                  url: image.toString(),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                title.toString(),
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
                maxLines: 2,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                '\$${price}',
                style: TextStyleClass.poppinsMedium(size: 15.00),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Qty : ',
                    style: TextStyleClass.poppinsBold(
                      size: 15.00,
                      color: ColorConst.green3D,
                    ),
                  ),
                  Text(
                    '$qty',
                    style: TextStyleClass.poppinsBold(
                        size: 15.00, color: ColorConst.green3D),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      cartCtrl.decrementQuantity(cartCtrl.items[index]);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: ColorConst.redButtonColor),
                      child: Center(
                          child: Text(
                        '-',
                        style: TextStyleClass.poppinsBold(
                            color: ColorConst.white, size: 20.0),
                      )),
                    ),
                  ),
                  SizedBox(
                    width: AppScreenUtil().screenWidth(4),
                  ),
                  Text(
                    cartCtrl.items[index].quantity.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(
                    width: AppScreenUtil().screenWidth(4),
                  ),
                  GestureDetector(
                    onTap: () {
                      cartCtrl.incrementQuantity(cartCtrl.items[index]);
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: ColorConst.green3D),
                      child: Center(
                          child: Text(
                        '+',
                        style: TextStyleClass.poppinsBold(
                            color: ColorConst.white, size: 20.0),
                      )),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),

              ///Remove Button

              GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomItemDialog(
                          buttonText2: 'Remove',
                          buttonText1: 'Cancel',
                          subTitle:
                              'Are you sure you want to remove this item from your cart?',
                          title: 'Remove Item',
                          onRemove: () {
                            cartCtrl.removeItem(cartCtrl.items[index]);
                          },
                        );
                      },
                    );
                  },
                  child: CustomButton(
                      buttonColor: ColorConst.red,
                      buttonIcon: ImageCons.shoppingBag,
                      buttonText: 'Remove Item',
                      buttonTextSize: 12))
            ],
          ),
        ),
      ),
    );
  }
}
