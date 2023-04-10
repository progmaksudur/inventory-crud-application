

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_crud_application/const/app_color_const.dart';
import 'package:inventory_crud_application/controller/app_widget_helper_controller.dart';
import 'package:inventory_crud_application/views/pages/landing_screen.dart';

Widget AppCustomFloatingActionButton(BuildContext context,bool isLandingPage){

  return GetBuilder<AppWidgetHelperController>(
    builder: (controller) => FloatingActionButton(
    clipBehavior: Clip.antiAlias,
    backgroundColor: Colors.white,
    elevation: 3,
    child:  CircleAvatar(
        radius: 30,
        backgroundColor: Colors.white,
        child: Icon(Icons.add,size: 40.sp,color:controller.floatAccButtonColor??AppColor.bottomIconColor),
      ),
    onPressed: (){
     controller.changeIndex(1);
      if(isLandingPage==false){
        Get.toNamed(LandingScreen.routeName);
      }

    },
  ));



}