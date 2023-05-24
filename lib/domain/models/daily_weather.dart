import 'dart:convert';

import 'package:weather_wizard/data/remote/dto/weather_dto.dart';

import '../../data/remote/dto/daily_weather_dto.dart';

class DailyWeather {
  DateTime day;
  double uvIndex;
  double feels_like;
  double min_temperature;
  double max_temperature;
  double temperature;
  double windSpeed;
  int clouds;
  int humidity;
  String description;
  String icon;
  String? lottieResource;

  DailyWeather({
    required this.day,
    required this.feels_like,
    required this.uvIndex,
    required this.clouds,
    required this.humidity,
    required this.windSpeed,
    required this.temperature,
    required this.min_temperature,
    required this.max_temperature,
    required this.description,
    required this.icon,
    required this.lottieResource,
  });

  factory DailyWeather.toWeatherModel(DailyDatum dto) => DailyWeather(
        day: dto.datetime,
        temperature: dto.temp,
        description: dto.weather.description,
        icon: dto.weather.icon,
        clouds: dto.clouds,
        humidity: dto.rh,
        windSpeed: dto.windSpd,
        min_temperature: dto.appMinTemp,
        max_temperature: dto.appMaxTemp,
        feels_like: ((dto.appMaxTemp + dto.appMaxTemp)/ 2).roundToDouble(),
        uvIndex: dto.uv,
        lottieResource: WeatherDTO.getLottieResourceForIcon(dto.weather.icon)
  );
}

