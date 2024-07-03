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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppScreenUtil().screenHeight(70)),
        child: Padding(
          padding: EdgeInsets.only(
              top: AppScreenUtil().screenHeight(8),
              left: AppScreenUtil().screenWidth(8),
              right: AppScreenUtil().screenWidth(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///Cart item number indication layout
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: ColorConst.red,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Obx(
                    () => Text(
                      cartCtrl.items.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(routeName.viewBagScreen);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConst.green3D,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppScreenUtil().screenHeight(5),
                      horizontal: AppScreenUtil().screenWidth(5),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ImageIcon(
                          AssetImage(
                            ImageCons.shoppingBag,
                          ),
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: AppScreenUtil().screenWidth(2),
                        ),
                        const Text(
                          'View Bag',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Obx(
        () => (homeCtrl.isLoading.value == true)
            ? const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.blueAccent,
                ),
              )
            : (homeCtrl.productList.isNotEmpty)
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "What's New",
                              style: TextStyleClass.poppinsMedium(
                                  color: ColorConst.black, size: 24.0),
                            ),
                            SizedBox(height: 10.h),
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                "Check out the latest products in our collection. We have a variety of new arrivals just for you. Don't miss out on the latest trends and best deals!",
                                style: TextStyleClass.poppinsRegular(
                                    color: ColorConst.grey83, size: 16.0),
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
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
                              mainAxisExtent: AppScreenUtil().screenHeight(265),
                            ),
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
                                      image:
                                          homeCtrl.productList[index].thumbnail,
                                      price: homeCtrl.productList[index].price
                                          .toString(),
                                      title: homeCtrl.productList[index].title,
                                      description: homeCtrl
                                          .productList[index].description,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: Text(
                      "No Products",
                      style: TextStyleClass.poppinsMedium(
                        color: ColorConst.grey83,
                        size: 20.0,
                      ),
                    ),
                  ),
      ),
    );
  }
}
