import 'package:ecommerce/presentation/screens/home_screen/view/home_screen.dart';
import 'package:ecommerce/presentation/screens/splash_screen/view/splash_screen.dart';
import 'package:ecommerce/presentation/screens/view_bag_screen/view/view_bag_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import 'route_name.dart';

RouteName _routeName = RouteName();

class AppRoute {
  final List<GetPage> getPages = [
    GetPage(
      name: '/',
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: _routeName.homeScreen,
      page: () => const HomeScreen(),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 500)
    ),
    GetPage(
      name: _routeName.viewBagScreen,
      page: () => const ViewBagScreen(),
      transition: Transition.fade,
      transitionDuration: Duration(milliseconds: 500)
    ),
  ];
}
