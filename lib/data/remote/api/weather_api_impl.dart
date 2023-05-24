// import 'dart:convert';
// import 'dart:developer';
// import 'package:http/http.dart' as http;
// import '../dto/daily_weather_dto.dart';
// import '../dto/hourly_weather_dto.dart';
//
//
// // La clé API ne devrait pas être ici mais tu m'as conpris, on rectifiera ça
// const apiKey = "cacf0ef7a81442af908ec209efbd4d33";
//
// String getApiURL(String city,String frequency) => "https://api.weatherbit.io/v2.0/forecast/$frequency?city=$city&key=$apiKey";
//
//
// class WeatherApiImpl{
//
//   // Ici c'est plutôt la ville qu'on devrait rendre mais on fera ça après
//   Future<DailyWeatherDto> getDailyWeather(city) async {
//
//     var url = Uri.parse(getApiURL(city,"daily"));
//     var response = await http.get(url);
//
//     try {
//       if(response.statusCode == 200){
//         var jsonString = jsonDecode(response.body);
//         return DailyWeatherDto.fromJson(jsonString);
//       }else {
//         return Future.error("An unexpected error has occured in getDailyWeather ");
//       }
//     }catch(e, stackTrace){
//       log('An error has occured in getDailyWeather : $e\n$stackTrace');
//       return Future.error("An error has occured in getDailyWeather : $e\n$stackTrace");
//     }
//
//
//   }
//
//   Future<HourlyWeatherDto> getHourlyWeather(String city) async {
//
//     var url = Uri.parse(getApiURL(city,"hourly"));
//     var response = await http.get(url);
//
//     try {
//         if(response.statusCode == 200){
//             var jsonString = jsonDecode(response.body);
//             return HourlyWeatherDto.fromJson(jsonString);
//         }else {
//           return Future.error("An unexpected error has occured in getHourlyWeather ");
//         }
//     }catch(e, stackTrace){
//       log('An error has occured in getHourlyWeather : $e\n$stackTrace');
//       return Future.error("An error has occured in getHourlyWeather : $e\n$stackTrace");
//     }
//
//   }
//
// }
//
//

import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_wizard/data/remote/api/weather_api.dart';
import 'package:weather_wizard/data/remote/dto/daily_weather_dto.dart';
import 'package:weather_wizard/data/remote/dto/hourly_weather_dto.dart';

import '../../../core/utils/config.dart';


class WeatherApiImpl {
  final WeatherApi _weatherApi;

  WeatherApiImpl() : _weatherApi = WeatherApi(Dio(), baseUrl: "https://api.weatherbit.io/v2.0/");

  Future<DailyWeatherDto> getDailyWeather(String city) async {
    try {
      return await _weatherApi.getDailyWeather(city, Config.apiKey);
    } catch (e, stackTrace) {
      log('An error has occurred in getDailyWeather: $e\n$stackTrace');
      throw Exception("An error has occurred in getDailyWeather: $e\n$stackTrace");
    }
  }

  Future<HourlyWeatherDto> getHourlyWeather(String city) async {
    try {
      return await _weatherApi.getHourlyWeather(city, Config.apiKey);
    } catch (e, stackTrace) {
      log('An error has occurred in getHourlyWeather: $e\n$stackTrace');
      throw Exception("An error has occurred in getHourlyWeather: $e\n$stackTrace");
    }
  }
}
