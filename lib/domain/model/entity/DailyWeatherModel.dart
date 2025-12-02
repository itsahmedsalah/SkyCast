class DailyWeatherModel {
  late List<String> weekDays;
  late List<int> weatherCodes;
  late List<int> maxTemperature;
  late List<int> minTemperature;

  DailyWeatherModel({
    required this.weekDays,
    required this.weatherCodes,
    required this.maxTemperature,
    required this.minTemperature,
  });
}
