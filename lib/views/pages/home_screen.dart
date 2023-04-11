import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_crud_application/controller/app_landing_page_controller.dart';
import 'package:inventory_crud_application/views/pages/product_details_screen.dart';
import 'package:inventory_crud_application/views/widgets/app_custom_product_card.dart';
import 'package:inventory_crud_application/views/widgets/app_customtext_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final landingController = Get.find<AppLandingPageController>();
      landingController.loadProductData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppLandingPageController>(
      builder: (controller) => controller.productList.isEmpty
          ? Center(
              child: AppCustomText(
              text: "Data Loading Wait ....",
            ))
          : ListView.builder(
              itemCount: controller.productList.length,
              itemBuilder: (context, index) {
                final model = controller.productList[index];
                return InkWell(
                  onTap: (){
                    Get.to(ProductDetailScreen(model: model,));
                  },
                  child: ProductListCard(
                    imageUrl: model.image??"",
                    productName: model.name,
                    barCode: model.barcode,
                    brandName: model.brand?.name??"Not Found",
                    price: model.productPrice?.price.toString()??"Not Found",
                    onDelete: () {
                      controller.deleteProduct(context, model.id.toString());
                    },
                  ),
                );
              },
            ),
    );
  }
}
