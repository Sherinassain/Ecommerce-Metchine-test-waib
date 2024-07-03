import 'package:ecommerce/core/utiles/app_utils.dart';
import 'package:ecommerce/presentation/screens/home_screen/service/res_model/home_screen_res_model.dart';
import 'package:ecommerce/presentation/screens/product_screen/service/product_service.dart';
import 'package:get/get.dart';


class ProductController extends GetxController {
  var isLoading = true.obs;

  List<Product> productList = [];
    
  num? totalItems;

  Future<void> getProductList() async {
    isLoading.value = true;
    update();
    try {
      ///avoids duplicate items
      productList.clear();
      final parsedResData = await ProductScreenService().getProductList();
      if (parsedResData.error != true) {

        if (parsedResData.data.products != null &&
            parsedResData.data.products!.isNotEmpty) {
          for (var element in parsedResData.data.products!) {
            productList.add(Product(
              id: element.id,
              title: element.title,
              description: element.description,
              price: element.price,
              discountPercentage: element.discountPercentage,
              rating: element.rating,
              stock: element.stock,
              brand: element.brand,
              category: element.category,
              thumbnail: element.thumbnail,
              images: element.images,
            ));
          }
          totalItems = parsedResData.data.total;
        }

        isLoading.value = false;
        update();

        AppUtils().printData(parsedResData.data, info: "product  list");
      } else {
        AppUtils.oneTimeSnackBar("Couldn't fetch data");
        isLoading.value = false;

        update();
      }
    } catch (e) {
      isLoading.value = false;

      update();
      print('Delivered order res data : $e');
    }
  }

 Future<void> getProductListWeb() async {
    isLoading.value = true;
    update();
    try {
      ///avoids duplicate items
      productList.clear();
      final parsedResData = await ProductScreenService().getProductListWeb();
      if (parsedResData.error != true) {

        if (parsedResData.data.products != null &&
            parsedResData.data.products!.isNotEmpty) {
          for (var element in parsedResData.data.products!) {
            productList.add(Product(
              id: element.id,
              title: element.title,
              description: element.description,
              price: element.price,
              discountPercentage: element.discountPercentage,
              rating: element.rating,
              stock: element.stock,
              brand: element.brand,
              category: element.category,
              thumbnail: element.thumbnail,
              images: element.images,
            ));
          }
          totalItems = parsedResData.data.total;
        }

        isLoading.value = false;
        update();

        AppUtils().printData(parsedResData.data, info: "product  list");
      } else {
        AppUtils.oneTimeSnackBar("Couldn't fetch data");
        isLoading.value = false;

        update();
      }
    } catch (e) {
      isLoading.value = false;

      update();
      print('Delivered order res data : $e');
    }
  }
}
