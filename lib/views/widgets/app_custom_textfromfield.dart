

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_crud_application/const/app_color_const.dart';
import 'package:inventory_crud_application/const/app_textstyles_const.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_sizebox.dart';
import 'package:inventory_crud_application/views/widgets/app_customtext_widget.dart';

class AppCustomTextFormField extends StatelessWidget {
  double? hight;
  double? width;
  Color? backgroundColor;
  bool? errorTextHas;
  FormFieldValidator<String>? validator;
  IconData? icon;
  IconData? suffixIcon;
  Color? borderColor;
  int? maxLine;
  String? errorMessage;
  bool? obscureText;
  String? hint;
  Function()? onIconPressed;
  Function()? onSuffixIconPressed;
  TextStyle? hintStyle;
  TextInputType? keyboardType;
  TextEditingController? controller;
  double? borderRadius;

  AppCustomTextFormField(
      {this.hight,
      this.width,
      this.borderRadius,
      this.backgroundColor,
      this.keyboardType,
      this.hint,
        this.errorTextHas=true,
      this.onSuffixIconPressed,
      this.suffixIcon,
      this.hintStyle,
      this.maxLine,
      this.obscureText,
      this.errorMessage,
      this.borderColor,
      this.validator,
      this.onIconPressed,
      this.controller,
      this.icon,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return errorTextHas==true?Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppCustomSizeBox(
          height: 8.h,
        ),
        Container(
          height: hight ?? 55.h,
          width: width ?? double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 5.r)),
            shape: BoxShape.rectangle,
            color: Colors.white,
          ),
          child: TextFormField(
            controller: controller,
            style: AppConstTextStyle.normalText14,
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            maxLines: maxLine ?? 1,
            decoration: InputDecoration(
              contentPadding: icon == null
                  ? EdgeInsets.fromLTRB(10.w, 2.h, 10.w, 12.h)
                  : null,
              prefixIcon: icon != null
                  ? InkWell(
                      onTap: onIconPressed ?? () {},
                      child: Icon(
                        icon,
                        color: AppColor.primaryColor,
                      ))
                  : null,
              suffixIcon: suffixIcon != null
                  ? InkWell(
                      onTap: onSuffixIconPressed,
                      child: Icon(suffixIcon,
                          color: AppColor.primaryColor.withOpacity(0.45)))
                  : null,
              hintText: hint ?? "",
              hintStyle: hintStyle ?? AppConstTextStyle.hintText,
              // border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor ?? AppColor.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(borderRadius??8.r)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor ?? AppColor.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(borderRadius??8.r)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: borderColor ?? AppColor.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(borderRadius??8.r)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
                      color: borderColor ?? AppColor.primaryColor,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(borderRadius??8.r)),
              errorStyle: const TextStyle(fontSize: 0),
            ),
            validator: validator,
          ),
        ),
        errorMessage != null
            ? AppCustomSizeBox(
                height: 8.h,
              )
            : SizedBox(),
        errorMessage != null
            ? AppCustomText(
                text: errorMessage.toString(),
                textStyle: AppConstTextStyle.normalText14,
              )
            : SizedBox(),
      ],
    ):Container(
      height: hight ?? 55.h,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 5.r)),
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: TextFormField(
        controller: controller,
        style: AppConstTextStyle.normalText14,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        maxLines: maxLine ?? 1,
        decoration: InputDecoration(
          contentPadding: icon == null
              ? EdgeInsets.fromLTRB(10.w, 2.h, 10.w, 12.h)
              : null,
          prefixIcon: icon != null
              ? InkWell(
              onTap: onIconPressed ?? () {},
              child: Icon(
                icon,
                color: AppColor.primaryColor,
              ))
              : null,
          suffixIcon: suffixIcon != null
              ? InkWell(
              onTap: onSuffixIconPressed,
              child: Icon(suffixIcon,
                  color: AppColor.primaryColor.withOpacity(0.45)))
              : null,
          hintText: hint ?? "",
          hintStyle: hintStyle ?? AppConstTextStyle.hintText,
          // border: InputBorder.none,
          focusedBorder: OutlineInputBorder(

              borderSide: BorderSide(
                color: borderColor ?? AppColor.primaryColor,
              ),
              borderRadius: BorderRadius.circular(borderRadius??8.r)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? AppColor.primaryColor,
              ),
              borderRadius: BorderRadius.circular(borderRadius??8.r)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: borderColor ?? AppColor.primaryColor,
              ),
              borderRadius: BorderRadius.circular(borderRadius??8.r)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1,
                  color: borderColor ?? AppColor.primaryColor,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(borderRadius??8.r)),
          errorStyle: const TextStyle(fontSize: 0),
        ),
        validator: validator,
      ),
    );
  }
}
