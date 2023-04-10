
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_crud_application/const/app_color_const.dart';
import 'package:inventory_crud_application/const/app_textstyles_const.dart';
import 'package:inventory_crud_application/views/widgets/app_customtext_widget.dart';


class AppCustomButton extends StatelessWidget {
  double? height;
  double? width;
  String? title;
  TextStyle? titleStyle;
  IconData? icon;
  Function() ?onPressed;
  Color? backgroundColor;
  Color? iconColor;
  double? shade;
  double? iconSize;
  double? borderRadius;


  AppCustomButton({this.height,
    this.width,this.title,
    this.icon, this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.shade,this.borderRadius,this.titleStyle,
    this.iconSize,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height??60.h,
        width: width??200.w,
          decoration: BoxDecoration(
            color:backgroundColor??Colors.white,
            borderRadius: BorderRadius.circular(borderRadius??5.r),
            border: Border.all(
              color: AppColor.primaryColor
            ),
            shape: BoxShape.rectangle,
          ),
          child:icon==null? Center(
            child: AppCustomText(
              text:title??"ACCEPT",textStyle: titleStyle??AppConstTextStyle.normalButtonText16,
            ),
          ):Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(icon,size: iconSize??18.sp,color: iconColor,),
              AppCustomText(
                text:title??"ACCEPT",textStyle: titleStyle??AppConstTextStyle.normalButtonText16,
              ),
            ],
          )

      ),
    );
  }
}