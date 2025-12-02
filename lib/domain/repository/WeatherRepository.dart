import 'package:skycast/domain/model/entity/CurrentWeatherModel.dart';
import 'package:skycast/domain/model/entity/DailyWeatherModel.dart';
import 'package:skycast/domain/model/entity/HourlyWeatherModel.dart';

abstract class WeatherRepository {
  Future<CurrentWeatherModel> getCurrentWeather();

  Future<HourlyWeatherModel> getHourlyWeather();

  Future<DailyWeatherModel> getDailyWeather();
}
