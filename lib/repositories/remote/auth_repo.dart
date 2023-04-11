

import 'package:dio/dio.dart';
import 'package:inventory_crud_application/const/app_api_url_strings.dart';
import 'package:inventory_crud_application/domain/models/base_model/api_response.dart';
import 'package:inventory_crud_application/domain/models/response_model/user_login_model.dart';
import 'package:inventory_crud_application/domain/services/dio/dio_client.dart';
import 'package:inventory_crud_application/domain/services/exception/api_error_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  AuthRepository({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> login(UserModel model) async {
    try {
      Response response = await dioClient.post(ApiHelperUrlStrings.login,
          data: model.toJson(),
          options: Options(headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          }));

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  // for  user token
  Future<void> saveUserToken(String token) async {
    dioClient.updateHeader(token, null);
    try {
      await sharedPreferences.setString(ApiHelperUrlStrings.token, token);
      print("========>Token Stored<=======");
      print(await sharedPreferences.getString(ApiHelperUrlStrings.token));
    } catch (e) {
      throw e;
    }
  }

  //save user token in local storage
  getUserToken() {
    SharedPreferences.getInstance();
    return sharedPreferences.getString(ApiHelperUrlStrings.token) ?? "";
  }

  // remove user token from local storage
  removeUserToken() async{
    await SharedPreferences.getInstance();
    return sharedPreferences.remove(ApiHelperUrlStrings.token);
  }

  //auth token
  // for  user token
  Future<void> saveAuthToken(String token) async {
    dioClient.token = token;
    dioClient.dio!.options.headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };

    try {
      await sharedPreferences.setString(ApiHelperUrlStrings.token, token);
    } catch (e) {
      throw e;
    }
  }

  String getAuthToken() {
    return sharedPreferences.getString(ApiHelperUrlStrings.token) ?? "";
  }


  bool isLoggedIn() {
    return sharedPreferences.containsKey(ApiHelperUrlStrings.token);
  }

  Future<bool> clearSharedData() async {
    //sharedPreferences.remove(AppConstants.CART_LIST);
    sharedPreferences.remove(ApiHelperUrlStrings.token);
    sharedPreferences.remove(ApiHelperUrlStrings.user);
    //FirebaseMessaging.instance.unsubscribeFromTopic(AppConstants.TOPIC);
    return true;
  }



}