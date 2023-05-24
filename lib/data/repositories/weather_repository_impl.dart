import '../../domain/models/daily_forecast.dart';
import '../../domain/models/hourly_forecast.dart';
import '../../domain/repositories/weather_repository.dart';
import '../remote/api/weather_api_impl.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherApiImpl _weatherApi;

  WeatherRepositoryImpl(this._weatherApi);

  @override
  Future<HourlyForecast> getHourlyForecast(String cityName) async {
      var dto = await _weatherApi.getHourlyWeather(cityName);

      return HourlyForecast.toHourlyForecastModel(dto);
  }

  @override
  Future<DailyForecast> getDailyForecast(String cityName) async {
    var dto = await _weatherApi.getDailyWeather(cityName);

    return DailyForecast.toDailyForecastModel(dto);
  }



}