import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_crud_application/const/app_color_const.dart';
import 'package:inventory_crud_application/const/app_helperstring_const.dart';
import 'package:inventory_crud_application/const/app_textstyles_const.dart';
import 'package:inventory_crud_application/views/pages/landing_screen.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_sizebox.dart';
import 'package:inventory_crud_application/views/widgets/app_customtext_widget.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName="/splashscreen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    load();


  }
  load()async{
    Timer(const Duration(seconds: 2), () {

      Get.toNamed(LandingScreen.routeName);
      // if (token.isEmpty) {
      //   Navigator.pushReplacementNamed(context, SignInPage.routeName);
      // } else {
      //   provider.saveToken(token);
      //   Navigator.of(context).pushReplacementNamed(LandingPage.routeName);
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppCustomText(text: AppHelperString.appName,textStyle: AppConstTextStyle.splashScreenText,),
            AppCustomSizeBox(height: 200.h,),
            const CircularProgressIndicator(
              color: AppColor.splashTextColor,
            )

          ],
        ),
      ),
    );
  }
}
