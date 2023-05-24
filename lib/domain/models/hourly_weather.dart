import 'dart:convert';

import '../../data/remote/dto/hourly_weather_dto.dart';


class HourlyWeather {
  String timestamp;
  double temperature;
  double windSpeed;
  int clouds;
  int humidity;
  String description;
  String icon;

  HourlyWeather({
    required this.timestamp,
    required this.clouds,
    required this.humidity,
    required this.windSpeed,
    required this.temperature,
    required this.description,
    required this.icon,
  });

  factory HourlyWeather.toWeatherModel(HourlyDatum dto) => HourlyWeather(
        timestamp: dto.datetime,
        temperature: dto.appTemp,
        description: dto.weather.description,
        icon: dto.weather.icon,
        clouds: dto.clouds,
        humidity: dto.rh,
        windSpeed: dto.windSpd
  );
}

