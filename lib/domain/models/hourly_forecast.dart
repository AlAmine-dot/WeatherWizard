
import '../../data/remote/dto/hourly_weather_dto.dart';
import 'hourly_weather.dart';


class HourlyForecast {
    final String cityname;
    final List<HourlyWeather> forecast;
    
    HourlyForecast({
      required this.forecast,
      required this.cityname
    });
    
    factory HourlyForecast.toHourlyForecastModel(HourlyWeatherDto dto) {
      final forecast = dto.data.map((e) => HourlyWeather.toWeatherModel(e)).toList();
      return HourlyForecast(
          forecast: forecast,
          cityname: dto.cityName
      );
    }
    
}