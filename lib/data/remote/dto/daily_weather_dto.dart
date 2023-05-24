// To parse this JSON data, do
//
//     final currentWeatherDto = currentWeatherDtoFromJson(jsonString);

import 'dart:convert';

import 'package:weather_wizard/data/remote/dto/weather_dto.dart';


DailyWeatherDto currentWeatherDtoFromJson(String str) => DailyWeatherDto.fromJson(json.decode(str));

String currentWeatherDtoToJson(DailyWeatherDto data) => json.encode(data.toJson());

class DailyWeatherDto {
  String cityName;
  String countryCode;
  List<DailyDatum> data;
  String stateCode;
  String timezone;

  DailyWeatherDto({
    required this.cityName,
    required this.countryCode,
    required this.data,
    required this.stateCode,
    required this.timezone,
  });

  factory DailyWeatherDto.fromJson(Map<String, dynamic> json) => DailyWeatherDto(
    cityName: json["city_name"],
    countryCode: json["country_code"],
    data: List<DailyDatum>.from(json["data"].map((x) => DailyDatum.fromJson(x))),
    stateCode: json["state_code"],
    timezone: json["timezone"],
  );

  Map<String, dynamic> toJson() => {
    "city_name": cityName,
    "country_code": countryCode,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "state_code": stateCode,
    "timezone": timezone,
  };
}

class DailyDatum {
  double appMaxTemp;
  double appMinTemp;
  int clouds;
  int cloudsHi;
  int cloudsLow;
  int cloudsMid;
  DateTime datetime;
  double dewpt;
  double highTemp;
  double lowTemp;
  dynamic maxDhi;
  double maxTemp;
  double minTemp;
  double moonPhase;
  double moonPhaseLunation;
  int moonriseTs;
  int moonsetTs;
  double ozone;
  int pop;
  double precip;
  double pres;
  int rh;
  double slp;
  int snow;
  int snowDepth;
  int sunriseTs;
  int sunsetTs;
  double temp;
  int ts;
  double uv;
  DateTime validDate;
  double vis;
  WeatherDTO weather;
  String windCdir;
  String windCdirFull;
  int windDir;
  double windGustSpd;
  double windSpd;

  DailyDatum({
    required this.appMaxTemp,
    required this.appMinTemp,
    required this.clouds,
    required this.cloudsHi,
    required this.cloudsLow,
    required this.cloudsMid,
    required this.datetime,
    required this.dewpt,
    required this.highTemp,
    required this.lowTemp,
    this.maxDhi,
    required this.maxTemp,
    required this.minTemp,
    required this.moonPhase,
    required this.moonPhaseLunation,
    required this.moonriseTs,
    required this.moonsetTs,
    required this.ozone,
    required this.pop,
    required this.precip,
    required this.pres,
    required this.rh,
    required this.slp,
    required this.snow,
    required this.snowDepth,
    required this.sunriseTs,
    required this.sunsetTs,
    required this.temp,
    required this.ts,
    required this.uv,
    required this.validDate,
    required this.vis,
    required this.weather,
    required this.windCdir,
    required this.windCdirFull,
    required this.windDir,
    required this.windGustSpd,
    required this.windSpd,
  });

  factory DailyDatum.fromJson(Map<String, dynamic> json) => DailyDatum(
    appMaxTemp: json["app_max_temp"]?.toDouble(),
    appMinTemp: json["app_min_temp"]?.toDouble(),
    clouds: json["clouds"],
    cloudsHi: json["clouds_hi"],
    cloudsLow: json["clouds_low"],
    cloudsMid: json["clouds_mid"],
    datetime: DateTime.parse(json["datetime"]),
    dewpt: json["dewpt"]?.toDouble(),
    highTemp: json["high_temp"]?.toDouble(),
    lowTemp: json["low_temp"]?.toDouble(),
    maxDhi: json["max_dhi"],
    maxTemp: json["max_temp"]?.toDouble(),
    minTemp: json["min_temp"]?.toDouble(),
    moonPhase: json["moon_phase"]?.toDouble(),
    moonPhaseLunation: json["moon_phase_lunation"]?.toDouble(),
    moonriseTs: json["moonrise_ts"],
    moonsetTs: json["moonset_ts"],
    ozone: json["ozone"]?.toDouble(),
    pop: json["pop"],
    precip: json["precip"]?.toDouble(),
    pres: json["pres"]?.toDouble(),
    rh: json["rh"],
    slp: json["slp"]?.toDouble(),
    snow: json["snow"],
    snowDepth: json["snow_depth"],
    sunriseTs: json["sunrise_ts"],
    sunsetTs: json["sunset_ts"],
    temp: json["temp"]?.toDouble(),
    ts: json["ts"],
    uv: json["uv"]?.toDouble(),
    validDate: DateTime.parse(json["valid_date"]),
    vis: json["vis"]?.toDouble(),
    weather: WeatherDTO.fromJson(json["weather"]),
    windCdir: json["wind_cdir"],
    // windCdirFull: windCdirFullValues.map[json["wind_cdir_full"]]!,
    windCdirFull: json["wind_cdir_full"],
    windDir: json["wind_dir"],
    windGustSpd: json["wind_gust_spd"]?.toDouble(),
    windSpd: json["wind_spd"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "app_max_temp": appMaxTemp,
    "app_min_temp": appMinTemp,
    "clouds": clouds,
    "clouds_hi": cloudsHi,
    "clouds_low": cloudsLow,
    "clouds_mid": cloudsMid,
    "datetime": "${datetime.year.toString().padLeft(4, '0')}-${datetime.month.toString().padLeft(2, '0')}-${datetime.day.toString().padLeft(2, '0')}",
    "dewpt": dewpt,
    "high_temp": highTemp,
    "low_temp": lowTemp,
    "max_dhi": maxDhi,
    "max_temp": maxTemp,
    "min_temp": minTemp,
    "moon_phase": moonPhase,
    "moon_phase_lunation": moonPhaseLunation,
    "moonrise_ts": moonriseTs,
    "moonset_ts": moonsetTs,
    "ozone": ozone,
    "pop": pop,
    "precip": precip,
    "pres": pres,
    "rh": rh,
    "slp": slp,
    "snow": snow,
    "snow_depth": snowDepth,
    "sunrise_ts": sunriseTs,
    "sunset_ts": sunsetTs,
    "temp": temp,
    "ts": ts,
    "uv": uv,
    "valid_date": "${validDate.year.toString().padLeft(4, '0')}-${validDate.month.toString().padLeft(2, '0')}-${validDate.day.toString().padLeft(2, '0')}",
    "vis": vis,
    "weather": weather.toJson(),
    "wind_cdir": windCdir,
    "wind_cdir_full": windCdirFull,
    "wind_dir": windDir,
    "wind_gust_spd": windGustSpd,
    "wind_spd": windSpd,
  };
}

// class WeatherDTO {
//   int code;
//   String description;
//   String icon;
//
//   WeatherDTO({
//     required this.code,
//     required this.description,
//     required this.icon,
//   });
//
//   factory WeatherDTO.fromJson(Map<String, dynamic> json) => WeatherDTO(
//     code: json["code"],
//     // description: descriptionValues.map[json["description"]]!,
//     description: json["description"],
//     // icon: iconValues.map[json["icon"]],
//     icon: json["icon"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "code": code,
//     "description": description,
//     // "icon": iconValues.reverse[icon],
//     "icon": icon,
//   };
// }

// enum Description { SCATTERED_CLOUDS, BROKEN_CLOUDS, FEW_CLOUDS }

// final descriptionValues = EnumValues({
//   "Broken clouds": Description.BROKEN_CLOUDS,
//   "Few clouds": Description.FEW_CLOUDS,
//   "Scattered clouds": Description.SCATTERED_CLOUDS
// });

// enum Icon { C02_D, C03_D }
//
// final iconValues = EnumValues({
//   "c02d": Icon.C02_D,
//   "c03d": Icon.C03_D
// });

// enum WindCdir { NW, NNW, WNW }
//
// final windCdirValues = EnumValues({
//   "NNW": WindCdir.NNW,
//   "NW": WindCdir.NW,
//   "WNW": WindCdir.WNW
// });

// enum WindCdirFull { NORTHWEST, NORTH_NORTHWEST, WEST_NORTHWEST }
//
// final windCdirFullValues = EnumValues({
//   "northwest": WindCdirFull.NORTHWEST,
//   "north-northwest": WindCdirFull.NORTH_NORTHWEST,
//   "west-northwest": WindCdirFull.WEST_NORTHWEST
// });

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
