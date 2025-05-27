// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) =>
    _WeatherModel(
      coord: Coord.fromJson(json['coord'] as Map<String, dynamic>),
      weather:
          (json['weather'] as List<dynamic>)
              .map((e) => Weather.fromJson(e as Map<String, dynamic>))
              .toList(),
      main: Main.fromJson(json['main'] as Map<String, dynamic>),
      name: json['name'] as String,
      sys: Sys.fromJson(json['sys'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherModelToJson(_WeatherModel instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weather,
      'main': instance.main,
      'name': instance.name,
      'sys': instance.sys,
    };

_Coord _$CoordFromJson(Map<String, dynamic> json) => _Coord(
  lon: (json['lon'] as num).toDouble(),
  lat: (json['lat'] as num).toDouble(),
);

Map<String, dynamic> _$CoordToJson(_Coord instance) => <String, dynamic>{
  'lon': instance.lon,
  'lat': instance.lat,
};

_Weather _$WeatherFromJson(Map<String, dynamic> json) => _Weather(
  id: (json['id'] as num).toInt(),
  main: json['main'] as String,
  description: json['description'] as String,
  icon: json['icon'] as String,
);

Map<String, dynamic> _$WeatherToJson(_Weather instance) => <String, dynamic>{
  'id': instance.id,
  'main': instance.main,
  'description': instance.description,
  'icon': instance.icon,
};

_Main _$MainFromJson(Map<String, dynamic> json) => _Main(
  temp: (json['temp'] as num).toDouble(),
  feels_like: (json['feels_like'] as num).toDouble(),
  temp_min: (json['temp_min'] as num).toDouble(),
  temp_max: (json['temp_max'] as num).toDouble(),
  pressure: (json['pressure'] as num).toInt(),
  humidity: (json['humidity'] as num).toInt(),
);

Map<String, dynamic> _$MainToJson(_Main instance) => <String, dynamic>{
  'temp': instance.temp,
  'feels_like': instance.feels_like,
  'temp_min': instance.temp_min,
  'temp_max': instance.temp_max,
  'pressure': instance.pressure,
  'humidity': instance.humidity,
};

_Sys _$SysFromJson(Map<String, dynamic> json) =>
    _Sys(country: json['country'] as String);

Map<String, dynamic> _$SysToJson(_Sys instance) => <String, dynamic>{
  'country': instance.country,
};
