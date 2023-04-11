

import 'package:dio/dio.dart';
import 'package:inventory_crud_application/const/app_api_url_strings.dart';
import 'package:inventory_crud_application/domain/models/base_model/api_response.dart';
import 'package:inventory_crud_application/domain/models/response_model/add_product_model.dart';
import 'package:inventory_crud_application/domain/services/dio/dio_client.dart';
import 'package:inventory_crud_application/domain/services/exception/api_error_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductRepository{

  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  ProductRepository({required this.dioClient,required this.sharedPreferences});


  Future<ApiResponse> loadProductData() async {
    try {
      Response response = await dioClient.get(ApiHelperUrlStrings.productData);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(e.toString());
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
  Future<ApiResponse> addProduct(AddProductModel model) async {
    print(model.image);
    try {
      Response response = await dioClient.post(ApiHelperUrlStrings.addProduct,
          data: {
            "name": "${model.name}",
            "barcode": "${model.barcode}",
            "description": "${model.description}",
            "image": model.image,
            "subCategory": 1851,
            "brand": 1901,
            "quantity": {
              "quantity": 0,
              "unit": "string",
              "unitValue": 0,
              "pastQuantity": 0
            },
            "productPrice": {
              "price": "${model.price}",
              "unitPrice": "${model.price}",
              "mrp": "${model.price}"
            }
          },
          options: Options(headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          }));
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> deleteData(String id) async {
    try {
      Response response = await dioClient.delete("${ApiHelperUrlStrings.delete}$id");
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(e.toString());
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }
}