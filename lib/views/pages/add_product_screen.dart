import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventory_crud_application/const/app_color_const.dart';
import 'package:inventory_crud_application/controller/app_landing_page_controller.dart';
import 'package:inventory_crud_application/domain/models/response_model/add_product_model.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_button.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_sizebox.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_textfromfield.dart';
import 'package:inventory_crud_application/views/widgets/app_customtext_widget.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final controller=Get.find<AppLandingPageController>();
  String imagePath = "";
  ImageSource imageSource = ImageSource.gallery;
  final nameController=TextEditingController();
  final barController=TextEditingController();
  final priceController=TextEditingController();
  final desController=TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    barController.dispose();
    priceController.dispose();
    desController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: ListView(
        children: [
          AppCustomTextFormField(
            controller: nameController,
            hint:"Product Name",
          ),
          AppCustomTextFormField(
            controller: barController,
              hint:"Bar Code"
          ),
          AppCustomTextFormField(
            controller: priceController,
              hint:"Price"
          ),
          AppCustomTextFormField(
            controller: desController,
              hint:"Descreption",
            maxLine: 5,
            hight: 120.h,
          ),
          UnconstrainedBox(child: imagePath.isEmpty?AppCustomText(text: "No Picture Selected",):Image.file(File(imagePath),height: 130.h,width: 250.w
            ,fit: BoxFit.fill,),),
          AppCustomSizeBox(height: 20.h,),
          Align(alignment: Alignment.centerRight,child: UnconstrainedBox(child: AppCustomButton(height: 60.h,width: 200.w,title: "Pick Product Image",icon: Icons.photo,iconColor: AppColor.primaryColor,
            onPressed: _getImage,))),
          AppCustomSizeBox(height: 15.h,),
          Align(alignment: Alignment.center,child: UnconstrainedBox(child:controller.addProductLoading==false? AppCustomButton(height: 50.h,width: 130.w,title: "Add Product",
            onPressed:(){
              addProduct(context,controller);

            },):const Center(child: CircularProgressIndicator(),))),


        ],
      ),
    );

  }

  void _getImage() async {
    final selectedImage = await ImagePicker().pickImage(source: imageSource);

    if (selectedImage != null) {
      setState(() {
        imagePath = selectedImage.path;
      });
      print(imagePath);
    }
  }

  addProduct(BuildContext context,AppLandingPageController controller){
    String name=nameController.text;
    String bar=barController.text;
    String price=priceController.text;
    String des=desController.text;

    if(name.isNotEmpty && bar.isNotEmpty && price.isNotEmpty && des.isNotEmpty ){
      final model=AddProductModel(name: name,barcode: bar,price: price,description: des,image: imagePath);
      controller.addProduct(model, context).then((value) => clearData());

    }else{
      print("Error");
    }

  }

  clearData(){
    setState(() {
      nameController.clear();
      barController.clear();
      priceController.clear();
      desController.clear();
      imagePath="";
    });
    }
}
