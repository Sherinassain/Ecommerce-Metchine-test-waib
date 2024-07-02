
import 'package:ecommerce/presentation/screens/contact_screen/view/contact_screen.dart';
import 'package:ecommerce/presentation/screens/home_screen/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const HomeScreen(),
    const ContactScreen()
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: const Center(child: Icon(Icons.home)),
            ),
            label: 'Home'
            
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: const Center(child: Icon(Icons.badge)),
            ),
            label: 'Product'
          ),
             BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: const Center(child: Icon(Icons.badge)),
            ),
            label: 'Contact'
          ),
        ],
       

        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}