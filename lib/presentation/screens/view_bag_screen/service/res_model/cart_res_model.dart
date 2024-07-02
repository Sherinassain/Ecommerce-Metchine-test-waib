import 'package:ecommerce/presentation/screens/home_screen/service/res_model/home_screen_res_model.dart';

class CartItem {
  final Product product;
  int quantity;
  
  CartItem({required this.product, this.quantity = 1});
}
