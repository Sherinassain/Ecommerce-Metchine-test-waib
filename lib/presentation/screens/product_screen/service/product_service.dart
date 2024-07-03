

import 'package:ecommerce/core/constants/color.dart';
import 'package:ecommerce/core/utiles/app_utils.dart';
import 'package:ecommerce/presentation/screens/product_screen/service/res_model/product_screen_res_model.dart';
import 'package:ecommerce/repository/api/api_helper.dart';
import 'package:ecommerce/repository/api/api_response.dart';

class ProductScreenService {
  Future<APIResponse<ProductScreenResData>> getProductList() async {
    try {
      final APIResponse response = await APIHelper.getData(
        finalUrl: 'https://dummyjson.com/products?limit=50',
        endPoint: 'products',
        header: APIHelper.getApiHeader(),
      );
      if (response.error == true) {
        return APIResponse(
            data: ProductScreenResData(), error: true, errorMessage: '');
      } else {
        final ProductScreenResData resData =
            ProductScreenResData.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: ColorConst.red);

      return APIResponse(
          data: ProductScreenResData(), error: true, errorMessage: '');
    }
  }

   Future<APIResponse<ProductScreenResData>> getProductListWeb() async {
    try {
      final APIResponse response = await APIHelper.getDataWeb(
        finalUrl: 'https://dummyjson.com/products?limit=50',
        endPoint: 'products',
        header: APIHelper.getApiHeader(),
      );
      if (response.error == true) {
        return APIResponse(
            data: ProductScreenResData(), error: true, errorMessage: '');
      } else {
        final ProductScreenResData resData =
            ProductScreenResData.fromJson(response.data);
        return APIResponse(data: resData, error: false, errorMessage: '');
      }
    } catch (e) {
      AppUtils.logger.e(e);
      AppUtils.oneTimeSnackBar('Could not complete the request',
          bgColor: ColorConst.red);

      return APIResponse(
          data: ProductScreenResData(), error: true, errorMessage: '');
    }
  }


}
