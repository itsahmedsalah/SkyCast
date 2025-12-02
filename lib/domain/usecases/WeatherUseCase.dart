import 'package:skycast/domain/model/entity/CurrentWeatherModel.dart';
import 'package:skycast/domain/model/entity/DailyWeatherModel.dart';
import 'package:skycast/domain/model/entity/HourlyWeatherModel.dart';
import 'package:skycast/domain/repository/WeatherRepository.dart';

class WeatherUseCase {
  final WeatherRepository weatherRepo;

  WeatherUseCase(this.weatherRepo);

  Future<CurrentWeatherModel> getCurrentWeather() async {
    return await weatherRepo.getCurrentWeather();
  }

  Future<HourlyWeatherModel> getHourlyWeather() async {
    HourlyWeatherModel hourlyWeather = await weatherRepo.getHourlyWeather();
    return hourlyWeather;
  }

  Future<DailyWeatherModel> getDailyWeather() async {
    DailyWeatherModel dailyWeatherModel = await weatherRepo.getDailyWeather();
    return dailyWeatherModel;
  }

}
