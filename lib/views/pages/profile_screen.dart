import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:inventory_crud_application/controller/app_authentication_controller.dart';
import 'package:inventory_crud_application/controller/app_landing_page_controller.dart';
import 'package:inventory_crud_application/controller/app_widget_helper_controller.dart';
import 'package:inventory_crud_application/views/pages/log_in_screen.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_button.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_image.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_profile_cards.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_sizebox.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final landingController=Get.find<AppLandingPageController>();
      landingController.loadUserData(context);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AppLandingPageController>(
        builder: (controller) =>controller.profileLoading==false?Column(
          children: [
            Expanded(flex: 1,child:AppCustomImage(imageUrl: controller.userProfileData?.imageUrl??"",)),
            Expanded(flex: 2,child:
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  AppCustomSizeBox(height: 20.h,),
                  AppCustomProfileCards(title: "Name", value: "${controller.userProfileData?.firstName??" "} ${controller.userProfileData?.lastName??" "}"),
                  AppCustomSizeBox(height: 20.h,),
                  AppCustomProfileCards(title: "email", value: controller.userProfileData?.email??" "),
                  AppCustomSizeBox(height: 20.h,),
                  AppCustomProfileCards(title: "phone", value: controller.userProfileData?.phone??" "),
                  AppCustomSizeBox(height: 20.h,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: AppCustomButton(height: 40.h,width: 120.w,title: "Log Out",onPressed: ()async{
                      final controller =Get.find<AppAuthController>();
                      final remove=await controller.removeUserToken();
                      if(remove==true){
                        controller.clearState();
                        Get.toNamed(LogInScreen.routeName);
                        Get.until((route) => route.settings.name == LogInScreen.routeName);
                      }
                    },),
                  ),




              ],),
            )),

          ],
        ):const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
