import 'package:ecommerce/core/constants/color.dart';
import 'package:ecommerce/core/constants/image.dart';
import 'package:ecommerce/core/constants/textstyle.dart';
import 'package:ecommerce/core/utiles/app_screen_util.dart';
import 'package:ecommerce/presentation/screens/home_screen/view/widgets/grid_list_tile.dart';
import 'package:ecommerce/presentation/screens/view_bag_screen/controller/cart_controller.dart';
import 'package:ecommerce/presentation/screens/view_bag_screen/view/widgets/view_bag_layout.dart';
import 'package:ecommerce/presentation/widgets/custom_button.dart';
import 'package:ecommerce/routes/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ViewBagScreen extends StatefulWidget {
  const ViewBagScreen({super.key});

  @override
  State<ViewBagScreen> createState() => _ViewBagScreenState();
}

class _ViewBagScreenState extends State<ViewBagScreen> {
  DateTime? lastPressed;
  final cartCtrl = Get.put(CartController());
  @override
  void initState() {
     WidgetsBinding.instance.addPostFrameCallback((_) {
    cartCtrl.onInit();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.only(
                  right: AppScreenUtil().screenWidth(30),
                  bottom: AppScreenUtil().screenHeight(10),
                  top: AppScreenUtil().screenHeight(10)),
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(routeName.viewBagScreen);
                },
                child: Container(
                  // height: AppScreenUtil().screenHeight(20),
                  // width: AppScreenUtil().screenWidth(80),
                  decoration: BoxDecoration(
                      color: ColorConst.green3D,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: AppScreenUtil().screenHeight(5),
                        horizontal: AppScreenUtil().screenWidth(5)),
                    child: Row(
                      children: [
                        ImageIcon(
                          AssetImage(
                            ImageCons.shoppingBag,
                          ),
                          // size: AppScreenUtil().screenWidth(26),
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: AppScreenUtil().screenWidth(2),
                        ),
                        Text(
                          'View Bag',
                          style: TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                              fontSize: 3.sp),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Obx(
            () => Column(
              children: [
                (cartCtrl.items.isNotEmpty)
                    ? Column(
                        children: List.generate(cartCtrl.items.length, (index) {
                        return ViewBagLayout(
                          index: index,
                          image: cartCtrl.items[index].product.thumbnail,
                          qty: cartCtrl.items[index].quantity.toString(),
                          title: cartCtrl.items[index].product.title,
                          price: (cartCtrl.items[index].product.price != null)
                              ? cartCtrl.items[index].product.price.toString()
                              : '0.0',
                        );
                      }))
                    : Center(
                        child: Text(
                          "Cart Empty!",
                          style: TextStyleClass.poppinsMedium(
                              color: ColorConst.grey83, size: 20.0),
                        ),
                      ),
                SizedBox(
                  height: 10.h,
                ),
                Visibility(
                  visible: (cartCtrl.items.isNotEmpty) ? true : false,
                  child: Padding(
                    padding: EdgeInsets.all(AppScreenUtil().screenWidth(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bag Total : \$${cartCtrl.totalPrice.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: ColorConst.green3D,
                              fontWeight: FontWeight.bold,
                              fontSize: 5.sp),
                        ),

                        ///Place order button
                        CustomButton(
                            buttonColor: ColorConst.green3D,
                            buttonIcon: ImageCons.shoppingBag,
                            buttonText: 'Place Order',
                            buttonTextSize: 3.sp)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
