class HourlyWeatherDto {
  HourlyWeatherDto({
      this.latitude,
      this.longitude,
      this.generationtimeMs,
      this.utcOffsetSeconds,
      this.timezone,
      this.timezoneAbbreviation,
      this.elevation,
      this.hourlyUnits,
      this.hourly,});

  HourlyWeatherDto.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    hourlyUnits = json['hourly_units'] != null ? HourlyUnits.fromJson(json['hourly_units']) : null;
    hourly = json['hourly'] != null ? Hourly.fromJson(json['hourly']) : null;
  }
  num? latitude;
  num? longitude;
  num? generationtimeMs;
  num? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  num? elevation;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;
HourlyWeatherDto copyWith({  num? latitude,
  num? longitude,
  num? generationtimeMs,
  num? utcOffsetSeconds,
  String? timezone,
  String? timezoneAbbreviation,
  num? elevation,
  HourlyUnits? hourlyUnits,
  Hourly? hourly,
}) => HourlyWeatherDto(  latitude: latitude ?? this.latitude,
  longitude: longitude ?? this.longitude,
  generationtimeMs: generationtimeMs ?? this.generationtimeMs,
  utcOffsetSeconds: utcOffsetSeconds ?? this.utcOffsetSeconds,
  timezone: timezone ?? this.timezone,
  timezoneAbbreviation: timezoneAbbreviation ?? this.timezoneAbbreviation,
  elevation: elevation ?? this.elevation,
  hourlyUnits: hourlyUnits ?? this.hourlyUnits,
  hourly: hourly ?? this.hourly,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['generationtime_ms'] = generationtimeMs;
    map['utc_offset_seconds'] = utcOffsetSeconds;
    map['timezone'] = timezone;
    map['timezone_abbreviation'] = timezoneAbbreviation;
    map['elevation'] = elevation;
    if (hourlyUnits != null) {
      map['hourly_units'] = hourlyUnits?.toJson();
    }
    if (hourly != null) {
      map['hourly'] = hourly?.toJson();
    }
    return map;
  }

}

class Hourly {
  Hourly({
      this.time,
      this.apparentTemperature,
      this.weatherCode,});

  Hourly.fromJson(dynamic json) {
    time = json['time'] != null ? json['time'].cast<String>() : [];
    apparentTemperature = json['apparent_temperature'] != null ? json['apparent_temperature'].cast<num>() : [];
    weatherCode = json['weather_code'] != null ? json['weather_code'].cast<num>() : [];
  }
  List<String>? time;
  List<num>? apparentTemperature;
  List<num>? weatherCode;
Hourly copyWith({  List<String>? time,
  List<num>? apparentTemperature,
  List<num>? weatherCode,
}) => Hourly(  time: time ?? this.time,
  apparentTemperature: apparentTemperature ?? this.apparentTemperature,
  weatherCode: weatherCode ?? this.weatherCode,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = time;
    map['apparent_temperature'] = apparentTemperature;
    map['weather_code'] = weatherCode;
    return map;
  }

}

class HourlyUnits {
  HourlyUnits({
      this.time,
      this.apparentTemperature,
      this.weatherCode,});

  HourlyUnits.fromJson(dynamic json) {
    time = json['time'];
    apparentTemperature = json['apparent_temperature'];
    weatherCode = json['weather_code'];
  }
  String? time;
  String? apparentTemperature;
  String? weatherCode;
HourlyUnits copyWith({  String? time,
  String? apparentTemperature,
  String? weatherCode,
}) => HourlyUnits(  time: time ?? this.time,
  apparentTemperature: apparentTemperature ?? this.apparentTemperature,
  weatherCode: weatherCode ?? this.weatherCode,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = time;
    map['apparent_temperature'] = apparentTemperature;
    map['weather_code'] = weatherCode;
    return map;
  }

}