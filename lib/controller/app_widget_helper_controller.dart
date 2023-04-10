

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:inventory_crud_application/const/app_color_const.dart';
import 'package:inventory_crud_application/views/pages/add_product_screen.dart';
import 'package:inventory_crud_application/views/pages/home_screen.dart';
import 'package:inventory_crud_application/views/pages/profile_screen.dart';

class AppWidgetHelperController extends GetxController{

  int _index=0;
  int get index=>_index;

  Color? _floatAccButtonColor;
  Color? get floatAccButtonColor => _floatAccButtonColor;


  void changeIndex(int changeIndex){
    print(changeIndex);
    _index=changeIndex;
    changeColor(index);
    update();
  }

  void changeColor(int index){
    if(index==1){
      _floatAccButtonColor=AppColor.primaryColor;
      update();
    }
    else{
      _floatAccButtonColor=null;
      update();
    }
  }

  String changeTitle(){
    if(index==0){
      return "Home";
    }
    else if(index==1){
      return "Add Product";
    }
    else{
      return "Profile";
    }
  }

  Widget changeLangingPageWidgets(int index){
    if(index==0){
      return HomeScreen();
    }
    else if(index==1){
      return AddProductScreen();
    }
    else{
      return ProfileScreen();
    }

  }




}