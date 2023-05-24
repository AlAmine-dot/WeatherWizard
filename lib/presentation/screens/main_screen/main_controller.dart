import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:weather_wizard/domain/models/daily_forecast.dart';
import 'package:weather_wizard/domain/models/daily_weather.dart';
import 'package:weather_wizard/presentation/screens/main_screen/main_state.dart';

import '../../../core/utils/constants.dart';
import '../../../data/repositories/weather_repository_impl.dart';

class MainScreenController extends GetxController {

  final WeatherRepositoryImpl repository;
  List<String> cities = ["Dakar", "Paris", "New York", "Tokyo", "Sydney"];
  MainScreenController(this.repository);

  final _mainScreenState = MainScreenState().obs;
  final int updateInterval = 10;
  Timer? _loadingTimer;
  Timer? _messageTimer;

  MainScreenState get getMainScreenState => _mainScreenState.value;

  @override
  void onInit() {
    super.onInit();
    startWaitingMessageTimer();
    startLoadingTimer();
  }

  void startWaitingMessageTimer() {
    _messageTimer = Timer.periodic(Duration(seconds: 6), (timer) {
      final currentIndex = Constants.WAITING_PHRASES.indexOf(_mainScreenState.value.waiterMessage);
      final nextIndex = (currentIndex + 1) % Constants.WAITING_PHRASES.length;
      final newWaiterMessage = Constants.WAITING_PHRASES[nextIndex];
      _mainScreenState.value = _mainScreenState.value.copyWith(waiterMessage: newWaiterMessage);
    });
  }

  void startLoadingTimer() async {
    int currentCityIndex = 0;
    int tickCount = 0;
    double newLoadLevel = 0.0;

    _loadingTimer = Timer.periodic(const Duration(seconds: 10), (timer) async {
      tickCount++;
      newLoadLevel += 0.1667;

      if (currentCityIndex < cities.length) {
        String currentCity = cities[currentCityIndex];
        DailyForecast newForecast = await repository.getDailyForecast(currentCity);
        _mainScreenState.value = _mainScreenState.value.addDailyForecast(newForecast);

        log("Here is new state :" + _mainScreenState.value.toString());

        currentCityIndex++;
      }


      if (newLoadLevel >= 0.9) {
        newLoadLevel = 1.1;
        timer.cancel();

        // Jauge remplie à 100%, effectuer les dernières actions ici :
        Timer(Duration(seconds: 2), () {
          _mainScreenState.value = _mainScreenState.value.copyWith(isWaiterMessageVisible: false);
          _messageTimer?.cancel();
        });
        Timer(Duration(seconds: 3), () {
          _mainScreenState.value = _mainScreenState.value.copyWith(isLoading: false);
        });
        Timer(Duration(seconds: 4), () {
          _mainScreenState.value = _mainScreenState.value.copyWith(loaderText: "Restart");
        });
      }

      _mainScreenState.value = _mainScreenState.value.copyWith(
          loadLevel: newLoadLevel,
          loaderText: "${newLoadLevel >= 1.1 ? "100" : (newLoadLevel * 100).toStringAsFixed(0)}%");
    });
  }

  void restartProcess(){
    _mainScreenState.value = MainScreenState();
    startWaitingMessageTimer();
    startLoadingTimer();
  }


  @override
  void onClose() {
    _loadingTimer?.cancel();
    super.onClose();
  }
}