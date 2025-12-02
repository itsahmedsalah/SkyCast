class CurrentWeatherDto {
  CurrentWeatherDto({
      this.latitude, 
      this.longitude, 
      this.generationtimeMs, 
      this.utcOffsetSeconds, 
      this.timezone, 
      this.timezoneAbbreviation, 
      this.elevation, 
      this.currentUnits, 
      this.current,});

  CurrentWeatherDto.fromJson(dynamic json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    currentUnits = json['current_units'] != null ? CurrentUnits.fromJson(json['current_units']) : null;
    current = json['current'] != null ? Current.fromJson(json['current']) : null;
  }
  num? latitude;
  num? longitude;
  num? generationtimeMs;
  num? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  num? elevation;
  CurrentUnits? currentUnits;
  Current? current;
CurrentWeatherDto copyWith({  num? latitude,
  num? longitude,
  num? generationtimeMs,
  num? utcOffsetSeconds,
  String? timezone,
  String? timezoneAbbreviation,
  num? elevation,
  CurrentUnits? currentUnits,
  Current? current,
}) => CurrentWeatherDto(  latitude: latitude ?? this.latitude,
  longitude: longitude ?? this.longitude,
  generationtimeMs: generationtimeMs ?? this.generationtimeMs,
  utcOffsetSeconds: utcOffsetSeconds ?? this.utcOffsetSeconds,
  timezone: timezone ?? this.timezone,
  timezoneAbbreviation: timezoneAbbreviation ?? this.timezoneAbbreviation,
  elevation: elevation ?? this.elevation,
  currentUnits: currentUnits ?? this.currentUnits,
  current: current ?? this.current,
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
    if (currentUnits != null) {
      map['current_units'] = currentUnits?.toJson();
    }
    if (current != null) {
      map['current'] = current?.toJson();
    }
    return map;
  }

}

class Current {
  Current({
      this.time, 
      this.interval, 
      this.temperature2m, 
      this.relativeHumidity2m, 
      this.apparentTemperature, 
      this.isDay, 
      this.rain, 
      this.weatherCode, 
      this.surfacePressure, 
      this.windSpeed10m,});

  Current.fromJson(dynamic json) {
    time = json['time'];
    interval = json['interval'];
    temperature2m = json['temperature_2m'];
    relativeHumidity2m = json['relative_humidity_2m'];
    apparentTemperature = json['apparent_temperature'];
    isDay = json['is_day'];
    rain = json['rain'];
    weatherCode = json['weather_code'];
    surfacePressure = json['surface_pressure'];
    windSpeed10m = json['wind_speed_10m'];
  }
  String? time;
  num? interval;
  num? temperature2m;
  num? relativeHumidity2m;
  num? apparentTemperature;
  num? isDay;
  num? rain;
  num? weatherCode;
  num? surfacePressure;
  num? windSpeed10m;
Current copyWith({  String? time,
  num? interval,
  num? temperature2m,
  num? relativeHumidity2m,
  num? apparentTemperature,
  num? isDay,
  num? rain,
  num? weatherCode,
  num? surfacePressure,
  num? windSpeed10m,
}) => Current(  time: time ?? this.time,
  interval: interval ?? this.interval,
  temperature2m: temperature2m ?? this.temperature2m,
  relativeHumidity2m: relativeHumidity2m ?? this.relativeHumidity2m,
  apparentTemperature: apparentTemperature ?? this.apparentTemperature,
  isDay: isDay ?? this.isDay,
  rain: rain ?? this.rain,
  weatherCode: weatherCode ?? this.weatherCode,
  surfacePressure: surfacePressure ?? this.surfacePressure,
  windSpeed10m: windSpeed10m ?? this.windSpeed10m,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = time;
    map['interval'] = interval;
    map['temperature_2m'] = temperature2m;
    map['relative_humidity_2m'] = relativeHumidity2m;
    map['apparent_temperature'] = apparentTemperature;
    map['is_day'] = isDay;
    map['rain'] = rain;
    map['weather_code'] = weatherCode;
    map['surface_pressure'] = surfacePressure;
    map['wind_speed_10m'] = windSpeed10m;
    return map;
  }

}

class CurrentUnits {
  CurrentUnits({
      this.time, 
      this.interval, 
      this.temperature2m, 
      this.relativeHumidity2m, 
      this.apparentTemperature, 
      this.isDay, 
      this.rain, 
      this.weatherCode, 
      this.surfacePressure, 
      this.windSpeed10m,});

  CurrentUnits.fromJson(dynamic json) {
    time = json['time'];
    interval = json['interval'];
    temperature2m = json['temperature_2m'];
    relativeHumidity2m = json['relative_humidity_2m'];
    apparentTemperature = json['apparent_temperature'];
    isDay = json['is_day'];
    rain = json['rain'];
    weatherCode = json['weather_code'];
    surfacePressure = json['surface_pressure'];
    windSpeed10m = json['wind_speed_10m'];
  }
  String? time;
  String? interval;
  String? temperature2m;
  String? relativeHumidity2m;
  String? apparentTemperature;
  String? isDay;
  String? rain;
  String? weatherCode;
  String? surfacePressure;
  String? windSpeed10m;
CurrentUnits copyWith({  String? time,
  String? interval,
  String? temperature2m,
  String? relativeHumidity2m,
  String? apparentTemperature,
  String? isDay,
  String? rain,
  String? weatherCode,
  String? surfacePressure,
  String? windSpeed10m,
}) => CurrentUnits(  time: time ?? this.time,
  interval: interval ?? this.interval,
  temperature2m: temperature2m ?? this.temperature2m,
  relativeHumidity2m: relativeHumidity2m ?? this.relativeHumidity2m,
  apparentTemperature: apparentTemperature ?? this.apparentTemperature,
  isDay: isDay ?? this.isDay,
  rain: rain ?? this.rain,
  weatherCode: weatherCode ?? this.weatherCode,
  surfacePressure: surfacePressure ?? this.surfacePressure,
  windSpeed10m: windSpeed10m ?? this.windSpeed10m,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time'] = time;
    map['interval'] = interval;
    map['temperature_2m'] = temperature2m;
    map['relative_humidity_2m'] = relativeHumidity2m;
    map['apparent_temperature'] = apparentTemperature;
    map['is_day'] = isDay;
    map['rain'] = rain;
    map['weather_code'] = weatherCode;
    map['surface_pressure'] = surfacePressure;
    map['wind_speed_10m'] = windSpeed10m;
    return map;
  }

}