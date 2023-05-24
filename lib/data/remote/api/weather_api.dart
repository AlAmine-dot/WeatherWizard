import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:weather_wizard/data/remote/dto/daily_weather_dto.dart';
import 'package:weather_wizard/data/remote/dto/hourly_weather_dto.dart';

part 'weather_api.g.dart';

@RestApi(baseUrl: "https://api.weatherbit.io/v2.0/")
abstract class WeatherApi {
  factory WeatherApi(Dio dio, {String baseUrl}) = _WeatherApi;

  @GET("forecast/daily")
  Future<DailyWeatherDto> getDailyWeather(@Query("city") String city, @Query("key") String apiKey);

  @GET("forecast/hourly")
  Future<HourlyWeatherDto> getHourlyWeather(@Query("city") String city, @Query("key") String apiKey);
}
