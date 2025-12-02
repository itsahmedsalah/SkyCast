class HourlyWeatherModel {
  late List<int> weatherCode;
  late List<int> temperature;
  late List<String> hourOfTheDay;

  HourlyWeatherModel({
    required this.weatherCode,
    required this.temperature,
    required this.hourOfTheDay,
  });
}
