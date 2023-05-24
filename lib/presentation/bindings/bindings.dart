import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:weather_wizard/presentation/screens/main_screen/main_controller.dart';

import '../../data/remote/api/weather_api_impl.dart';
import '../../data/repositories/weather_repository_impl.dart';

class AppBinding extends Bindings {


  @override
  void dependencies() {
    WeatherApiImpl weatherApi = WeatherApiImpl();
    WeatherRepositoryImpl weatherRepository = WeatherRepositoryImpl(weatherApi);
    Get.put(MainScreenController(weatherRepository));
    // Get.lazyPut<MainScreenController>(() => MainScreenController());
    // Get.lazyPut<MyRepository>(() => MyRepositoryImpl(dataSource: Get.find()));
    // Get.lazyPut<MyDataSource>(() => MyDataSource());
  }
}