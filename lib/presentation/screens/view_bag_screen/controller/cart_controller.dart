import 'dart:convert';

import 'package:ecommerce/core/constants/color.dart';
import 'package:ecommerce/core/utiles/app_utils.dart';
import 'package:ecommerce/presentation/screens/home_screen/service/res_model/home_screen_res_model.dart';
import 'package:ecommerce/presentation/screens/view_bag_screen/service/res_model/cart_res_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  var items = <CartItem>[].obs;

  double get totalPrice =>
      items.fold(0.0, (sum, item) => sum + item.product.price! * item.quantity);

  void addItem(Product product) {
    for (var item in items) {
      if (item.product.title == product.title) {
        item.quantity++;
        AppUtils.oneTimeSnackBar(
            'Item already added! Increasing the item quantity.',
            bgColor: ColorConst.green3D);
        items.refresh();
        _saveToStorage();

        return;
      }
    }
    items.add(CartItem(product: product));
    _saveToStorage();
  }

  void removeItem(CartItem cartItem) {
    items.remove(cartItem);
    _saveToStorage();
  }

  void incrementQuantity(CartItem cartItem) {
    cartItem.quantity++;
    items.refresh();
    _saveToStorage();
  }

  void decrementQuantity(CartItem cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
      items.refresh();
      _saveToStorage();
    } else {
      AppUtils.oneTimeSnackBar('Cannot decrease quantity below zero',
          bgColor: ColorConst.red);
    }
  }

  void _saveToStorage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        'cart_items',
        jsonEncode(items
            .map((item) => {
                  'product': {
                    'name': item.product.title,
                    'image': item.product.thumbnail,
                    'price': item.product.price,
                  },
                  'quantity': item.quantity,
                })
            .toList()));
  }

  void _loadFromStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('cart_items');
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      items.value = jsonList
          .map((jsonItem) => CartItem(
                product: Product(
                  title: jsonItem['product']['name'],
                  thumbnail: jsonItem['product']['image'],
                  price: jsonItem['product']['price'],
                ),
                quantity: jsonItem['quantity'],
              ))
          .toList();
    }
  }
 void clearCart() {
    items.clear();
  }
  @override
  void onInit() {
    _loadFromStorage();
    super.onInit();
  }
}
