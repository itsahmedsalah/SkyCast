import 'package:skycast/data/DataModel/CurrentWeatherDTO.dart';
import 'package:skycast/data/DataModel/DailyWeatherDTO.dart';
import 'package:skycast/data/DataModel/HourlyWeatherDTO.dart';
import 'package:skycast/domain/model/entity/CurrentWeatherModel.dart';
import 'package:skycast/domain/model/entity/DailyWeatherModel.dart';
import 'package:skycast/domain/model/entity/HourlyWeatherModel.dart';

extension CurrentWeahterDTOMapper on CurrentWeatherDto {
  bool get isDay => current?.isDay == 1 ? true : false;

  CurrentWeatherModel toModel() => CurrentWeatherModel(
    currentTemp: current?.temperature2m?.toInt() ?? 0,
    apparentTemperature: current?.apparentTemperature?.toInt() ?? 0,
    humidity: current?.relativeHumidity2m?.toInt() ?? 0,
    windSpeed: current?.windSpeed10m?.toInt() ?? 0,
    pressure: current?.surfacePressure?.toInt() ?? 0,
    rain: current?.rain?.toInt() ?? 0,
    weatherCode: current?.weatherCode?.toInt() ?? 0,
    isDay: isDay,
  );
}

extension HourlyWeatherDTOMapper on HourlyWeatherDto {
  HourlyWeatherModel toModel() => HourlyWeatherModel(
    weatherCode: hourly?.weatherCode?.map((e) => e.toInt()).toList() ?? [],
    temperature:
        hourly?.apparentTemperature?.map((e) => e.toInt()).toList() ?? [],
    hourOfTheDay:
        hourly?.time?.map((e) => e.toString().split('T')[1]).toList() ?? [],
  );
}

extension DailyWeatherMapper on DailyWeatherDto {
  DailyWeatherModel toModel() {
    final dailyData = daily;

    final times = dailyData?.time ?? [];
    final weatherCodes = dailyData?.weatherCode ?? [];
    final maxTemps = dailyData?.temperature2mMax ?? [];
    final minTemps = dailyData?.temperature2mMin ?? [];

    return DailyWeatherModel(
      weekDays: times.map(_dateToWeekday).toList(),
      weatherCodes: weatherCodes.map((e) => e.toInt()).toList(),
      maxTemperature: maxTemps.map((e) => e.toInt()).toList(),
      minTemperature: minTemps.map((e) => e.toInt()).toList(),
    );
  }
}

String _dateToWeekday(String dateString) {
  final date = DateTime.tryParse(dateString);
  if (date == null) return "";

  const days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];

  return days[date.weekday - 1];
}
