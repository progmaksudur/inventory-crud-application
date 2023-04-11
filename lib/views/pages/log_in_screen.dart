import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_crud_application/const/app_color_const.dart';
import 'package:inventory_crud_application/const/app_helperstring_const.dart';
import 'package:inventory_crud_application/const/app_textstyles_const.dart';
import 'package:inventory_crud_application/controller/app_authentication_controller.dart';
import 'package:inventory_crud_application/controller/app_widget_helper_controller.dart';
import 'package:inventory_crud_application/domain/models/response_model/user_login_model.dart';
import 'package:inventory_crud_application/views/pages/landing_screen.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_button.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_sizebox.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_textfromfield.dart';
import 'package:inventory_crud_application/views/widgets/app_customtext_widget.dart';

class LogInScreen extends StatefulWidget {
  static const String routeName = "/loginpage";
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  ValueNotifier<bool> visibility = ValueNotifier(true);
  ValueNotifier<bool> remember = ValueNotifier(false);
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller=Get.find<AppAuthController>();
    userNameController.text=controller.getUserName();
    passwordController.text=controller.getUserPass();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userNameController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AppAuthController>(
        builder: (authController) => ListView(
          children: [
            AppCustomSizeBox(
              height: 250.h,
            ),
            Center(
                child: AppCustomText(
              text: AppHelperString.appName,
              textStyle: AppConstTextStyle.splashScreenText,
            )),
            AppCustomSizeBox(
              height: 30.h,
            ),
            UnconstrainedBox(
                child: AppCustomSizeBox(
                    width: 260.w,
                    child: AppCustomTextFormField(
                      controller: userNameController,
                      hint: "User Name",
                    ))),
            AppCustomSizeBox(),
            UnconstrainedBox(
                child: AppCustomSizeBox(
                    width: 260.w,
                    child: ValueListenableBuilder(
                        valueListenable: visibility,
                        builder: (context, value, _) => AppCustomTextFormField(
                              controller: passwordController,
                              hint: "Password",
                              obscureText: value,
                              suffixIcon: value == true
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              onSuffixIconPressed: () {
                                visibility.value = !value;
                              },
                            )))),
            AppCustomSizeBox(
              height: 30.h,
            ),
            Row(
              children: [
                AppCustomSizeBox(
                  width: 35.w,
                ),
                Theme(
                    data: ThemeData(
                        unselectedWidgetColor: AppColor.primaryColor,
                        toggleableActiveColor: AppColor.primaryColor

                        // Change the checkbox border color here
                        ),
                    child: ValueListenableBuilder(
                      valueListenable: remember,
                      builder: (context, value, _) => Checkbox(
                        value: value,
                        onChanged: (tap) {
                          remember.value = tap!;
                        },
                        checkColor: Colors.white,
                      ),
                    )),
                AppCustomText(
                  text: AppHelperString.rememberMe,
                )
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 52.w),
                child: UnconstrainedBox(
                    child: ValueListenableBuilder(
                      valueListenable: remember,
                      builder: (context, value, _) =>  AppCustomSizeBox(
                          width: 140.w,
                          child: authController.logInIsLoading==false?AppCustomButton(
                            title: AppHelperString.logIn,
                            height: 40.h,
                            onPressed: () {
                              logInButtonPress(context, authController,value);
                            },
                          ):const Center(child: CircularProgressIndicator(),)),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
  logInButtonPress(BuildContext context,AppAuthController authController,bool remember)async{
    String userName=userNameController.text;
    String password=passwordController.text;


    if(userName.isNotEmpty && password.isNotEmpty){
      UserModel model = UserModel(username: userName, password: password, rememberMe: remember);
       final logIn=await authController.login(model, context);
       if(logIn==true){
         if(remember==true){
           authController.saveUserNamePass(userName, password);
         }else{
           authController.removeUserPass();
         }
         userNameController.clear();
         passwordController.clear();
         final appHelperController=Get.find<AppWidgetHelperController>();
         appHelperController.changeIndex(0);
         Get.toNamed(LandingScreen.routeName);
       }
    }

  }
}
