import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:inventory_crud_application/domain/models/base_model/api_response.dart';
import 'package:inventory_crud_application/domain/models/response_model/add_product_model.dart';
import 'package:inventory_crud_application/domain/models/response_model/product_list_model.dart';
import 'package:inventory_crud_application/domain/models/response_model/user_profile_data.dart';
import 'package:inventory_crud_application/repositories/local/local_hive_repository.dart';
import 'package:inventory_crud_application/repositories/remote/product_repo.dart';
import 'package:inventory_crud_application/repositories/remote/profile_repo.dart';

class AppLandingPageController extends GetxController{
  final ProfileRepository profileRepository;
  final LocalProductRepository localProductRepository;
  final ProductRepository productRepository;



  AppLandingPageController({required this.profileRepository,required this.productRepository,required this.localProductRepository});

  bool _profileLoading=false;
  bool get profileLoading=>_profileLoading;

  bool _deleteLoading=false;
  bool get deleteLoading=>_deleteLoading;

  bool _productLoading=false;
  bool get productLoading=>_productLoading;

  bool _addProductLoading=false;
  bool get addProductLoading => _addProductLoading;

  UserProfileData? _userProfileData;
  UserProfileData? get userProfileData=>_userProfileData;


  List<ProductListModel> _productList = [];
  List<ProductListModel> get productList => _productList;

  Future<void> loadUserData(BuildContext context)async{
    _profileLoading=true;
    update();
    if (_userProfileData == null) {
      ApiResponse apiResponse = await profileRepository.getProfileData();
      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        _userProfileData=UserProfileData.fromJson(apiResponse.response!.data);
        _profileLoading=false;
        update();
      } else {
        _profileLoading=false;
        update();
        print(apiResponse.response!.statusCode);
      }
    }else{
      _profileLoading=false;
      update();
    }
  }

  Future<void> loadProductData(BuildContext context)async{
    _productLoading=true;
    update();
      final apiResponse = await productRepository.loadProductData();
      if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
        List<dynamic> sampleList = [];
        final data = apiResponse.response!.data;
        sampleList=data;
        print("---------------->$sampleList");
        addProductInLocal(sampleList.map((json) => ProductListModel.fromJson(json)).toList());
        print("++++++++++>${productList.length}");
        update();
      } else {
        _productLoading=false;
        firstTimeDataLoadFromLocal();
        update();
        print(apiResponse.response!.statusCode);
      }
  }

   addProductInLocal(List<ProductListModel> products)async{
    localProductRepository.saveProducts(products);
    final data= await localProductRepository.getProducts();
    _productList=data;
    update();
  }

  firstTimeDataLoadFromLocal()async{
    final data= await localProductRepository.getProducts();
    print(data.length);
    _productList=data;
    update();
  }

  Future<bool> addProduct(AddProductModel model,BuildContext context) async {
    _addProductLoading=true;
    update();
    ApiResponse apiResponse = await productRepository.addProduct(model);

    if (apiResponse.response != null && apiResponse.response!.statusCode == 201) {

      Map map = apiResponse.response!.data;
      _addProductLoading=false;
      loadProductData(context);
      update();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Successfully Add Product"),
        elevation: 6.0,
        duration: Duration(seconds: 2),
        backgroundColor:  Colors.green,
      ));
      return true;

    } else{
      _addProductLoading=false;
      update();
      print("*********************I am In********************");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('${apiResponse.error}'),
        backgroundColor: Colors.red,
      ));
      return false;
    }
  }

  Future<void> deleteProduct(BuildContext context,String id)async{
    _deleteLoading=true;
    update();

      ApiResponse apiResponse = await productRepository.deleteData(id);
      if (apiResponse.response != null && apiResponse.response!.statusCode == 204) {
        _deleteLoading=false;
        loadProductData(context);
        update();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("SuccessFully Delete"),
          elevation: 6.0,
          duration: Duration(seconds: 2),
          backgroundColor:  Colors.green,
        ));

      } else {
        _deleteLoading=false;
        update();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("${apiResponse.response!.statusCode}"),
          elevation: 6.0,
          duration: Duration(seconds: 2),
          backgroundColor:  Colors.green,
        ));
        print(apiResponse.response!.statusCode);
      }
  }


  clearState(){
    _userProfileData=null;
    update();
  }



}