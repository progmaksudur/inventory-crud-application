
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:inventory_crud_application/controller/app_widget_helper_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';




final sl = GetIt.instance;

Future<void> init() async {

  //Controller using Factory
    sl.registerFactory(()=> AppWidgetHelperController());






  //repositories using registerLazySingleton





    ////Dio Client

    //managers
    // sl.registerLazySingleton(() => TokenManager());

    // External
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
    sl.registerLazySingleton(() => Dio());

}
