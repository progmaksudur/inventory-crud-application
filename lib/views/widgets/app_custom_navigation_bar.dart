

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_crud_application/const/app_color_const.dart';
import 'package:inventory_crud_application/const/app_helperstring_const.dart';
import 'package:inventory_crud_application/controller/app_widget_helper_controller.dart';
import 'package:inventory_crud_application/views/pages/landing_screen.dart';


Widget AppCustomBottomAppBar(BuildContext context,bool isLandingPage){

  return  BottomAppBar(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    notchMargin: 6.h,
    elevation: 10,
    shape: const CircularNotchedRectangle(),
    child: GetBuilder<AppWidgetHelperController>(
      builder: (controller) => BottomNavigationBar(
        currentIndex: controller.index,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: isLandingPage==true?AppColor.primaryColor:AppColor.bottomIconColor,
        unselectedItemColor:AppColor.bottomIconColor,
        showUnselectedLabels: true,
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        onTap: (value){
          controller.changeIndex(value);
          if(isLandingPage==false){
            Get.toNamed(LandingScreen.routeName);
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: AppHelperString.home),
          BottomNavigationBarItem(icon: Icon(null),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: AppHelperString.profile),
        ],

      ),
    ),

  );
}


