import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:inventory_crud_application/domain/models/base_model/api_response.dart';
import 'package:inventory_crud_application/domain/models/response_model/user_login_model.dart';
import 'package:inventory_crud_application/repositories/remote/auth_repo.dart';

class AppAuthController extends GetxController{

  final AuthRepository authRepository;
  AppAuthController({required this.authRepository});

  bool _logInIsLoading=false;
  bool  get logInIsLoading=>_logInIsLoading;



  Future<bool> login(UserModel model,BuildContext context) async {
    String token = "";
    authRepository.saveUserToken(token);
    _logInIsLoading = true;
    update();
    ApiResponse apiResponse = await authRepository.login(model);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("SuccessFully Log In"),
        elevation: 6.0,
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ));
      token = map["id_token"];
      print("--------------token----------------------->>>>>" + token);
      if (token != null && token.isNotEmpty) {
        authRepository.saveUserToken(token);
        // await authRepo.updateToken();
      }
      _logInIsLoading = false;
      update();
      return true;
    }
    else {
      print("*********************I am In********************");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${apiResponse.error}'),
        backgroundColor: Colors.red,
      ));
      print(apiResponse.error);
      // callback(false, '', '' , errorMessage);
      _logInIsLoading = false;
      update();
      return false;
    }
  }


  String getAuthToken() {
    return authRepository.getAuthToken();
  }
  void saveToken(String token){
    authRepository.saveUserToken(token);
    update();

  }

  void saveUserNamePass(String user ,String pass){
    authRepository.saveUserNamePass(user, pass);
    update();
  }
  String getUserName() {
    return authRepository.getUserName();
  }
  String getUserPass() {
    return authRepository.getUserPass();
  }

  Future<bool> removeUserPass() async{
    print(authRepository.removeRememberPass());
    print(authRepository.removeRememberUser());
    final userRemove=await authRepository.removeRememberUser();
    final passRemove=await authRepository.removeRememberPass();
    update();
    if(userRemove==true && passRemove==true){
      return true;
    }
    else{
      return false;
    }
  }

  Future<bool> removeUserToken() async{
    print(authRepository.removeUserToken());
    final tokenRemove=await authRepository.removeUserToken();
    update();
    if(tokenRemove==true){
      return true;
    }
    else{
      return false;
    }
  }

  void clearState(){
    _logInIsLoading=false;
    update();
  }

}