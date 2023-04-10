
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';




final sl = GetIt.instance;

Future<void> init() async {

  //Controller using Factory





  //repositories using registerLazySingleton





    ////Dio Client

    //managers
    // sl.registerLazySingleton(() => TokenManager());

    // External
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton(() => sharedPreferences);
    sl.registerLazySingleton(() => Dio());

}
