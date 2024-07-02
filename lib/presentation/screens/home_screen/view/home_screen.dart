import 'package:ecommerce/core/constants/color.dart';
import 'package:ecommerce/core/constants/image.dart';
import 'package:ecommerce/core/constants/textstyle.dart';
import 'package:ecommerce/core/utiles/app_screen_util.dart';
import 'package:ecommerce/presentation/screens/home_screen/controller/home_controller.dart';
import 'package:ecommerce/presentation/screens/home_screen/view/widgets/grid_list_tile.dart';
import 'package:ecommerce/presentation/screens/view_bag_screen/controller/cart_controller.dart';
import 'package:ecommerce/routes/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeCtrl = Get.put(HomeController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeCtrl.getProductList();
    });
  }

  DateTime? lastPressed;
  final cartCtrl = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return
        // WillPopScope(
        //   onWillPop: () async {
        //     DateTime now = DateTime.now();
        //     if (lastPressed == null ||
        //         now.difference(lastPressed!) > Duration(seconds: 2)) {
        //       lastPressed = now;
        //       Fluttertoast.showToast(
        //         msg: "Press back again to exit",
        //         backgroundColor: Colors.black,
        //         textColor: Colors.white,
        //       );
        //       return false;
        //     }

        //     ///Exit the app
        //     FlutterExitApp.exitApp();
        //     return true; // Return true to allow the app to exit
        //   },
        //   child:
        Scaffold(
            appBar: PreferredSize(
                preferredSize:
                    Size.fromHeight(AppScreenUtil().screenHeight(70)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///Cart item number indication layout
                    Padding(
                      padding: EdgeInsets.all(AppScreenUtil().screenWidth(4)),
                      child: Container(
                        height: AppScreenUtil().screenWidth(9),
                        width: AppScreenUtil().screenWidth(9),
                        decoration: BoxDecoration(
                            color: ColorConst.red, shape: BoxShape.circle),
                        child: Center(
                          child: Obx(
                            () => Text(
                              cartCtrl.items.length.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 5.sp),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(routeName.viewBagScreen);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(AppScreenUtil().screenWidth(5)),
                        child: Align(
                          alignment: Alignment.topRight,
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
                                mainAxisSize: MainAxisSize.min,
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
                                        fontWeight: FontWeight.w500,
                                        fontSize: 3.sp),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            body: Obx(
              () => (homeCtrl.isLoading.value == true)
                  ? const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.blueAccent,
                      ),
                    )
                  : (homeCtrl.productList.isNotEmpty)
                      ? Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: GridView.builder(
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              itemCount: homeCtrl.productList.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5.w,
                                      mainAxisSpacing: 5.h,
                                      mainAxisExtent: 300),
                              itemBuilder: (context, index) {
                                return AnimationConfiguration.staggeredGrid(
                                  columnCount: 2,
                                  duration: const Duration(milliseconds: 300),
                                  position: index,
                                  child: ScaleAnimation(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      child: FadeInAnimation(
                                          duration: Duration(milliseconds: 300),
                                          curve: Curves.fastLinearToSlowEaseIn,
                                          child: GridListTile(
                                            index: index,
                                            image: homeCtrl
                                                .productList[index].thumbnail,
                                            price: homeCtrl
                                                .productList[index].price
                                                .toString(),
                                            title: homeCtrl
                                                .productList[index].title,
                                            description: homeCtrl
                                                .productList[index].description,
                                          ))),
                                );
                              }),
                        )
                      : Center(
                          child: Text(
                            "No Products",
                            style: TextStyleClass.poppinsMedium(
                                color: ColorConst.grey83, size: 20.0),
                          ),
                        ),
            ));
  }
}
