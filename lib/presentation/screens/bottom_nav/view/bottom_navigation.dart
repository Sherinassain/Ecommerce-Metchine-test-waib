import 'package:ecommerce/presentation/screens/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:ecommerce/presentation/screens/contact_screen/view/contact_screen.dart';
import 'package:ecommerce/presentation/screens/home_screen/view/home_screen.dart';
import 'package:ecommerce/presentation/screens/product_screen/view/product_screen.dart';
import 'package:ecommerce/presentation/screens/view_bag_screen/view/view_bag_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

final bottomNavCtrl = Get.put(BottomNavController());

class _BottomNavState extends State<BottomNav> {
  final List<Widget> screens = [
    const HomeScreen(),
    const ProductScreen(),
    const ContactScreen(),
    const ViewBagScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
    Scaffold(
        body: screens[bottomNavCtrl.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: const Center(child: Icon(Icons.home)),
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: const Center(child: Icon(Icons.category)),
                ),
                label: 'Product'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: const Center(child: Icon(Icons.contacts)),
                ),
                label: 'Contact'),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: const Center(child: Icon(Icons.local_mall)),
                ),
                label: 'Cart'),
          ],
          currentIndex: bottomNavCtrl.selectedIndex.value,
          onTap: (index) {
            setState(() {
              bottomNavCtrl.selectedIndex.value = index;
            });
          },
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
