
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:inventory_crud_application/const/app_api_url_strings.dart';
import 'package:inventory_crud_application/controller/app_authentication_controller.dart';
import 'package:inventory_crud_application/controller/app_landing_page_controller.dart';
import 'package:inventory_crud_application/controller/app_widget_helper_controller.dart';
import 'package:inventory_crud_application/domain/services/dio/dio_client.dart';
import 'package:inventory_crud_application/domain/services/dio/logging_interceptor.dart';
import 'package:inventory_crud_application/repositories/local/local_hive_repository.dart';
import 'package:inventory_crud_application/repositories/remote/auth_repo.dart';
import 'package:inventory_crud_application/repositories/remote/product_repo.dart';
import 'package:inventory_crud_application/repositories/remote/profile_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';




final sl = GetIt.instance;

Future<void> init() async {

  //Controller using Factory
    sl.registerFactory(()=> AppWidgetHelperController());
    sl.registerFactory(()=> AppAuthController(authRepository: sl()));
    sl.registerFactory(()=> AppLandingPageController(profileRepository: sl(),productRepository: sl(),localProductRepository: sl()));






  //repositories using registerLazySingleton
    sl.registerLazySingleton(() => AuthRepository (dioClient: sl(), sharedPreferences: sl()));
    sl.registerLazySingleton(() => ProfileRepository(dioClient: sl(), sharedPreferences: sl()));
    sl.registerLazySingleton(() => ProductRepository(dioClient: sl(), sharedPreferences: sl()));
    sl.registerLazySingleton(() => LocalProductRepository());



    ////Dio Client
    sl.registerLazySingleton(() => DioClient(ApiHelperUrlStrings.baseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

    //managers
    // sl.registerLazySingleton(() => TokenManager());

    // External
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
    sl.registerLazySingleton(() => Dio());
    sl.registerLazySingleton(() => LoggingInterceptor());
}
