import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_crud_application/const/app_color_const.dart';
import 'package:inventory_crud_application/const/app_helperstring_const.dart';
import 'package:inventory_crud_application/const/app_textstyles_const.dart';
import 'package:inventory_crud_application/views/pages/landing_screen.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_button.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_sizebox.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_textfromfield.dart';
import 'package:inventory_crud_application/views/widgets/app_customtext_widget.dart';

class LogInScreen extends StatefulWidget {
  static const String routeName="/loginpage";
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        children: [

          AppCustomSizeBox(height: 250.h,),
          Center(child: AppCustomText(text: AppHelperString.appName,textStyle: AppConstTextStyle.splashScreenText,)),
          AppCustomSizeBox(height: 30.h,),
          UnconstrainedBox(child: AppCustomSizeBox(
              width: 260.w,
              child: AppCustomTextFormField())),
          AppCustomSizeBox(),
          UnconstrainedBox(child: AppCustomSizeBox(
              width: 260.w,
              child: AppCustomTextFormField())),
          AppCustomSizeBox(height: 30.h,),
          Row(
            children: [
                AppCustomSizeBox(width: 35.w,),
                Theme(
                    data: ThemeData(
                      unselectedWidgetColor: AppColor.primaryColor,
                      toggleableActiveColor: AppColor.primaryColor

                      // Change the checkbox border color here
                    ),
                    child: Checkbox(value: false, onChanged: (bool){},checkColor: Colors.white,)),
              AppCustomText(text: AppHelperString.rememberMe,)
            ],
          ),

          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 52.w),
              child: UnconstrainedBox(child: AppCustomSizeBox(
                  width: 140.w,
                  child: AppCustomButton(title: AppHelperString.logIn,height: 40.h,onPressed: (){
                        Get.toNamed(LandingScreen.routeName);

                  },))),
            ),
          ),



        ],
      ),
    );
  }
}
