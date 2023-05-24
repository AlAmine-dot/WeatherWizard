import '../../../core/utils/constants.dart';
import '../../../domain/models/daily_forecast.dart';

class MainScreenState {
  final bool isLoading;
  final double loadLevel;
  final String waiterMessage;
  final String loaderText;
  final bool isWaiterMessageVisible;
  final List<DailyForecast> dailyForecasts;

  MainScreenState({
    this.isLoading = true,
    this.isWaiterMessageVisible = true,
    this.loadLevel = 0.0,
    this.loaderText = "0%",
    String? waiterMessage,
    List<DailyForecast>? dailyForecasts
  }) : waiterMessage = waiterMessage ?? Constants.WAITING_PHRASES.first, dailyForecasts = dailyForecasts ?? List.empty();

  MainScreenState copyWith({
    bool? isLoading,
    bool? isWaiterMessageVisible,
    double? loadLevel,
    String? waiterMessage,
    String? loaderText,
    List<DailyForecast>? dailyForecasts
  }) {
    return MainScreenState(
      isLoading: isLoading ?? this.isLoading,
      loadLevel: loadLevel ?? this.loadLevel,
      waiterMessage: waiterMessage ?? this.waiterMessage,
      isWaiterMessageVisible: isWaiterMessageVisible ?? this.isWaiterMessageVisible,
      loaderText: loaderText ?? this.loaderText,
      dailyForecasts: dailyForecasts ?? this.dailyForecasts,
    );
  }

  MainScreenState addDailyForecast(DailyForecast forecast) {
    List<DailyForecast> updatedForecasts = List.from(dailyForecasts);
    updatedForecasts.add(forecast);
    return copyWith(dailyForecasts: updatedForecasts);
  }

  @override
  String toString() {
    return 'MainScreenState{isLoading: $isLoading, loadLevel: $loadLevel, waiterMessage: $waiterMessage, loaderText: $loaderText, isWaiterMessageVisible: $isWaiterMessageVisible, dailyForecasts: $dailyForecasts}';
  }
}