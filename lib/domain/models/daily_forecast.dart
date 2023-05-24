import '../../data/remote/dto/daily_weather_dto.dart';
import 'daily_weather.dart';


class DailyForecast {
    final String cityname;
    final List<DailyWeather> forecast;
    
    DailyForecast({
      required this.forecast,
      required this.cityname
    });
    
    factory DailyForecast.toDailyForecastModel(DailyWeatherDto dto) {
      final forecast = dto.data.map((e) => DailyWeather.toWeatherModel(e)).toList();
      return DailyForecast(
          forecast: forecast,
          cityname: dto.cityName
      );
    }
    
}