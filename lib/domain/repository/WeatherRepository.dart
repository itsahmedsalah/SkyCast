import 'package:skycast/domain/model/entity/CurrentWeatherModel.dart';
import 'package:skycast/domain/model/entity/DailyWeatherModel.dart';
import 'package:skycast/domain/model/entity/HourlyWeatherModel.dart';

abstract class WeatherRepository {
  Future<CurrentWeatherModel> getCurrentWeather(double lat, double lon);

  Future<HourlyWeatherModel> getHourlyWeather(double lat, double lon);

  Future<DailyWeatherModel> getDailyWeather(double lat, double lon);
}
