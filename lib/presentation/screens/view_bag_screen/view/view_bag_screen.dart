import 'package:ecommerce/core/constants/color.dart';
import 'package:ecommerce/core/constants/image.dart';
import 'package:ecommerce/core/constants/textstyle.dart';
import 'package:ecommerce/core/utiles/app_screen_util.dart';
import 'package:ecommerce/core/utiles/app_utils.dart';
import 'package:ecommerce/presentation/screens/home_screen/view/widgets/grid_list_tile.dart';
import 'package:ecommerce/presentation/screens/view_bag_screen/controller/cart_controller.dart';
import 'package:ecommerce/presentation/screens/view_bag_screen/view/widgets/view_bag_layout.dart';
import 'package:ecommerce/presentation/widgets/custom_button.dart';
import 'package:ecommerce/presentation/widgets/remove_item_alert_dilogue.dart';
import 'package:ecommerce/routes/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

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
              child: Obx(
                () => Text(
                  'Bag Total : \$${cartCtrl.totalPrice.toStringAsFixed(2)}',
                  style: TextStyle(
                      color: ColorConst.green3D,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            )
          ],
        ),
        body: Obx(
          () => (cartCtrl.items.isEmpty)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Lottie.asset(
                        'assets/images/Empty_animation.json', // Path to your .json animation file
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Cart Empty! Add Items",
                      style: TextStyleClass.poppinsMedium(
                          color: ColorConst.grey83, size: 20.0),
                    ),
                  ],
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Column(
                          children:
                              List.generate(cartCtrl.items.length, (index) {
                        return ViewBagLayout(
                          index: index,
                          image: cartCtrl.items[index].product.thumbnail,
                          qty: cartCtrl.items[index].quantity.toString(),
                          title: cartCtrl.items[index].product.title,
                          price: (cartCtrl.items[index].product.price != null)
                              ? cartCtrl.items[index].product.price.toString()
                              : '0.0',
                        );
                      })),
                      SizedBox(
                        height: 10.h,
                      ),
                      Visibility(
                        visible: (cartCtrl.items.isNotEmpty) ? true : false,
                        child: Padding(
                          padding:
                              EdgeInsets.all(AppScreenUtil().screenWidth(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bag Total : \$${cartCtrl.totalPrice.toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: ColorConst.green3D,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),

                              ///Place order button
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return CustomItemDialog(
                                        buttonText2: 'Confirm',
                                        buttonText1: 'Cancel',
                                        subTitle:
                                            'Are you sure you want to place this order?',
                                        title: 'Confirm Order',
                                        onRemove: () {
                                          cartCtrl.clearCart();
                                          AppUtils.oneTimeSnackBar(
                                              'Order Placed Successfully',
                                              bgColor: ColorConst.green3D);
                                        },
                                      );
                                    },
                                  );
                                },
                                child: CustomButton(
                                    buttonColor: ColorConst.green3D,
                                    buttonIcon: ImageCons.shoppingBag,
                                    buttonText: 'Place Order',
                                    buttonTextSize: 13),
                              )
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
