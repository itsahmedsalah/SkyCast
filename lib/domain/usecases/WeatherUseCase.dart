import 'package:skycast/domain/model/entity/CurrentWeatherModel.dart';
import 'package:skycast/domain/model/entity/DailyWeatherModel.dart';
import 'package:skycast/domain/model/entity/HourlyWeatherModel.dart';
import 'package:skycast/domain/repository/WeatherRepository.dart';

class WeatherUseCase {
  final WeatherRepository weatherRepo;

  WeatherUseCase(this.weatherRepo);

  Future<CurrentWeatherModel> getCurrentWeather(double lat, double lon) async {
    return await weatherRepo.getCurrentWeather(lat, lon);
  }

  Future<HourlyWeatherModel> getHourlyWeather(double lat, double lon) async {
    HourlyWeatherModel hourlyWeather = await weatherRepo.getHourlyWeather(lat, lon);
    return hourlyWeather;
  }

  Future<DailyWeatherModel> getDailyWeather(double lat, double lon) async {
    DailyWeatherModel dailyWeatherModel = await weatherRepo.getDailyWeather(lat, lon);
    return dailyWeatherModel;
  }

}
