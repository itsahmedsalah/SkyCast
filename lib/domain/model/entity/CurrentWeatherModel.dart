class CurrentWeatherModel {
  int currentTemp;
  int weatherCode;
  int windSpeed;
  int humidity;
  int pressure;
  int rain;
  int apparentTemperature;
  bool isDay;

  CurrentWeatherModel({
    required this.currentTemp,
    required this.weatherCode,
    required this.windSpeed,
    required this.humidity,
    required this.pressure,
    required this.rain,
    required this.apparentTemperature,
    required this.isDay,
  });
}
