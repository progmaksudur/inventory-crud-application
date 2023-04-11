import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_crud_application/const/app_textstyles_const.dart';
import 'package:inventory_crud_application/domain/models/response_model/product_list_model.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_image.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_sizebox.dart';
import 'package:inventory_crud_application/views/widgets/app_customtext_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName="/productdetails";
  final ProductListModel? model;
  const ProductDetailScreen({this.model,Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Product Details"),),
      body: Column(
        children: [
          AppCustomSizeBox(height: 20.h,),
          Expanded(flex: 1,child:AppCustomImage(imageUrl: widget.model?.image??"",)),
          Expanded(flex: 2,child:
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              children: [
                AppCustomSizeBox(height: 20.h,),
                AppCustomText(text: widget.model?.name??"",textStyle: AppConstTextStyle.normalText14w500,),
                Row(
                  children: [
                    Expanded(child:AppCustomText(text: "Price : \$ ${widget.model?.productPrice?.price}",textStyle: AppConstTextStyle.normalText14,),),
                    AppCustomSizeBox(width: 8.w,),
                    Expanded(child: AppCustomText(text: "Quantity : ${widget.model?.quantity?.quantity}",textStyle: AppConstTextStyle.normalText14,)),
                  ],
                ),
                AppCustomText(text: "Brand Name : ${widget.model?.brand?.name} ",textStyle: AppConstTextStyle.normalText14w500,),
                Row(
                  children: [
                    Expanded(flex: 2,child:AppCustomText(text: "Bar Code : ${widget.model?.barcode}? ",textStyle: AppConstTextStyle.normalText10,), ),
                    AppCustomSizeBox(width: 8.w,),
                    Expanded(flex: 3,child: AppCustomText(text: "SubCategory :${widget.model?.subCategory?.name}",textStyle: AppConstTextStyle.normalText10,)),
                  ],
                ),
                AppCustomText(text: widget.model?.description??"",),
              ],),
          )),

        ],
      ),
    );

  }
}
