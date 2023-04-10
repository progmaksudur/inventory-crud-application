import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:inventory_crud_application/controller/app_widget_helper_controller.dart';
import 'package:inventory_crud_application/views/pages/landing_screen.dart';
import 'package:inventory_crud_application/views/pages/log_in_screen.dart';
import 'package:inventory_crud_application/views/pages/product_details_screen.dart';
import 'package:inventory_crud_application/views/pages/splash_screen.dart';
import 'di_container.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
  Get.put(AppWidgetHelperController());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:const Size(360, 800),
        builder: (_, widget) => GetMaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primarySwatch: Colors.teal,
              ),
              initialRoute: SplashScreen.routeName,
              getPages: [
                GetPage(name: SplashScreen.routeName, page: () => SplashScreen()),
                GetPage(name: LogInScreen.routeName, page: () => LogInScreen()),
                GetPage(name: LandingScreen.routeName, page: () => LandingScreen()),
                GetPage(name: ProductDetailScreen.routeName, page: () => ProductDetailScreen()),
              ],
            ));
  }
}
