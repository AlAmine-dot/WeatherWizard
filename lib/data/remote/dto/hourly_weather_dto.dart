// To parse this JSON data, do
//
//     final hourlyWeatherDto = hourlyWeatherDtoFromJson(jsonString);

import 'dart:convert';

import 'package:weather_wizard/data/remote/dto/weather_dto.dart';


HourlyWeatherDto hourlyWeatherDtoFromJson(String str) => HourlyWeatherDto.fromJson(json.decode(str));

String hourlyWeatherDtoToJson(HourlyWeatherDto data) => json.encode(data.toJson());

class HourlyWeatherDto {
  String cityName;
  String countryCode;
  List<HourlyDatum> data;
  String stateCode;
  String timezone;

  HourlyWeatherDto({
    required this.cityName,
    required this.countryCode,
    required this.data,
    required this.stateCode,
    required this.timezone,
  });

  factory HourlyWeatherDto.fromJson(Map<String, dynamic> json) => HourlyWeatherDto(
    cityName: json["city_name"],
    countryCode: json["country_code"],
    data: List<HourlyDatum>.from(json["data"].map((x) => HourlyDatum.fromJson(x))),
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

class HourlyDatum {
  double appTemp;
  int clouds;
  int cloudsHi;
  int cloudsLow;
  int cloudsMid;
  String datetime;
  double dewpt;
  double dhi;
  double dni;
  double ghi;
  double ozone;
  Pod pod;
  int pop;
  int precip;
  double pres;
  int rh;
  double slp;
  int snow;
  int snowDepth;
  double solarRad;
  double temp;
  DateTime timestampLocal;
  DateTime timestampUtc;
  int ts;
  double uv;
  double vis;
  WeatherDTO weather;
  String windCdir;
  String windCdirFull;
  int windDir;
  double windGustSpd;
  double windSpd;

  HourlyDatum({
    required this.appTemp,
    required this.clouds,
    required this.cloudsHi,
    required this.cloudsLow,
    required this.cloudsMid,
    required this.datetime,
    required this.dewpt,
    required this.dhi,
    required this.dni,
    required this.ghi,
    required this.ozone,
    required this.pod,
    required this.pop,
    required this.precip,
    required this.pres,
    required this.rh,
    required this.slp,
    required this.snow,
    required this.snowDepth,
    required this.solarRad,
    required this.temp,
    required this.timestampLocal,
    required this.timestampUtc,
    required this.ts,
    required this.uv,
    required this.vis,
    required this.weather,
    required this.windCdir,
    required this.windCdirFull,
    required this.windDir,
    required this.windGustSpd,
    required this.windSpd,
  });

  factory HourlyDatum.fromJson(Map<String, dynamic> json) => HourlyDatum(
    appTemp: json["app_temp"]?.toDouble(),
    clouds: json["clouds"],
    cloudsHi: json["clouds_hi"],
    cloudsLow: json["clouds_low"],
    cloudsMid: json["clouds_mid"],
    datetime: json["datetime"],
    dewpt: json["dewpt"]?.toDouble(),
    dhi: json["dhi"]?.toDouble(),
    dni: json["dni"]?.toDouble(),
    ghi: json["ghi"]?.toDouble(),
    ozone: json["ozone"]?.toDouble(),
    pod: podValues.map[json["pod"]]!,
    pop: json["pop"],
    precip: json["precip"],
    pres: json["pres"]?.toDouble(),
    rh: json["rh"],
    slp: json["slp"]?.toDouble(),
    snow: json["snow"],
    snowDepth: json["snow_depth"],
    solarRad: json["solar_rad"]?.toDouble(),
    temp: json["temp"]?.toDouble(),
    timestampLocal: DateTime.parse(json["timestamp_local"]),
    timestampUtc: DateTime.parse(json["timestamp_utc"]),
    ts: json["ts"],
    uv: json["uv"]?.toDouble(),
    vis: json["vis"]?.toDouble(),
    weather: WeatherDTO.fromJson(json["weather"]),
    windCdir: json["wind_cdir"],
    windCdirFull: json["wind_cdir_full"],
    windDir: json["wind_dir"],
    windGustSpd: json["wind_gust_spd"]?.toDouble(),
    windSpd: json["wind_spd"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "app_temp": appTemp,
    "clouds": clouds,
    "clouds_hi": cloudsHi,
    "clouds_low": cloudsLow,
    "clouds_mid": cloudsMid,
    "datetime": datetime,
    "dewpt": dewpt,
    "dhi": dhi,
    "dni": dni,
    "ghi": ghi,
    "ozone": ozone,
    "pod": podValues.reverse[pod],
    "pop": pop,
    "precip": precip,
    "pres": pres,
    "rh": rh,
    "slp": slp,
    "snow": snow,
    "snow_depth": snowDepth,
    "solar_rad": solarRad,
    "temp": temp,
    "timestamp_local": timestampLocal.toIso8601String(),
    "timestamp_utc": timestampUtc.toIso8601String(),
    "ts": ts,
    "uv": uv,
    "vis": vis,
    "weather": weather.toJson(),
    "wind_cdir": windCdir,
    "wind_cdir_full": windCdirFull,
    "wind_dir": windDir,
    "wind_gust_spd": windGustSpd,
    "wind_spd": windSpd,
  };
}

enum Pod { D, N }

final podValues = EnumValues({
  "d": Pod.D,
  "n": Pod.N
});


class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
