import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_crud_application/const/app_textstyles_const.dart';
import 'package:inventory_crud_application/controller/app_landing_page_controller.dart';
import 'package:inventory_crud_application/controller/app_widget_helper_controller.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_floating_action_bar.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_navigation_bar.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_sizebox.dart';
import 'package:inventory_crud_application/views/widgets/app_customtext_widget.dart';

class LandingScreen extends StatefulWidget {
  static const String routeName="/landingscreen";
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppWidgetHelperController>(
      builder: (controller) =>WillPopScope(
         onWillPop:  ()async{
          if(controller.index==0){
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  scrollable: true,
                  title: Text("Alert"),
                  content: Text("Do you want to Exit?"),
                  actions: [
                    TextButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: Text("Stay",style: AppConstTextStyle.stayGreen,)),
                    TextButton(onPressed: (){
                      exit(0);
                    }, child: Text("Yes",style: AppConstTextStyle.exitRed,)),
                  ],
                );
              },
            );
            return true;

          }
          else{
            controller.changeIndex(0);
            return false;
          }
        },

        child: Scaffold(
          appBar: AppBar(
            leading: controller.index==0?AppCustomSizeBox():BackButton(),
            title: AppCustomText(text: controller.changeTitle(),textStyle: AppConstTextStyle.appbarTextStyle,),
          ),
          body: controller.changeLangingPageWidgets(controller.index),
          bottomNavigationBar: AppCustomBottomAppBar(context,true),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: AppCustomFloatingActionButton(context,true),

        ),
      ),
    );
  }
}
