import '../models/daily_forecast.dart';
import '../models/hourly_forecast.dart';

abstract class WeatherRepository {

  Future<HourlyForecast> getHourlyForecast(String cityName);

  Future<DailyForecast> getDailyForecast(String cityName);

}