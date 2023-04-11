
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_crud_application/const/app_color_const.dart';
import 'package:inventory_crud_application/const/app_textstyles_const.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_image.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_sizebox.dart';
import 'package:inventory_crud_application/views/widgets/app_customtext_widget.dart';

class ProductListCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String price;
  final String barCode;
  final String brandName;
  Function() onDelete;
  ProductListCard({required this.imageUrl,required this.productName,required this.price,required this.brandName,required this.barCode,required this.onDelete,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w,vertical: 4.h),
      child: Card(
        elevation: 6.sp,
        shadowColor: AppColor.splashTextColor,
        child: Container(
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(flex: 1,child: AppCustomImage(imageUrl: imageUrl,)),
              AppCustomSizeBox(width: 20.w,),
              Expanded(flex: 3,child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                AppCustomSizeBox(height: 10.h,),
                AppCustomText(text: productName,textStyle: AppConstTextStyle.normalText12,),
                Row(
                  children: [
                    Expanded(child: AppCustomText(text: barCode,textStyle: AppConstTextStyle.normalText10,)),
                    Expanded(child: AppCustomText(text: "Price : \$ $price",textStyle: AppConstTextStyle.normalText12,)),

                  ],
                ),
                Row(
                  children: [
                    AppCustomText(text: brandName,textStyle: AppConstTextStyle.normalText14w500,),
                    Spacer(),
                    InkWell(onTap: onDelete,child: Icon(Icons.delete_outline,color: Colors.red,size: 25.h,)),
                    AppCustomSizeBox(width: 10.w,)
                  ],
                ),

              ],)),
            ],
          ),
        ),
      ),
    );
  }
}
