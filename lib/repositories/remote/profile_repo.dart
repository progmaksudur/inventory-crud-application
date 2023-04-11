

import 'package:dio/dio.dart';
import 'package:inventory_crud_application/const/app_api_url_strings.dart';
import 'package:inventory_crud_application/domain/models/base_model/api_response.dart';
import 'package:inventory_crud_application/domain/services/dio/dio_client.dart';
import 'package:inventory_crud_application/domain/services/exception/api_error_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepository{
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;

  ProfileRepository({required this.dioClient,required this.sharedPreferences});

  Future<ApiResponse> getProfileData() async {
    try {
      Response response = await dioClient.get(ApiHelperUrlStrings.userData);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      print(e.toString());
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }



}