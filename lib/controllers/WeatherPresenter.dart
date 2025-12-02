import 'package:get/get.dart';
import 'package:skycast/domain/model/entity/CurrentWeatherModel.dart';
import 'package:skycast/domain/model/entity/DailyWeatherModel.dart';
import 'package:skycast/domain/model/entity/HourlyWeatherModel.dart';
import 'package:skycast/domain/usecases/WeatherUseCase.dart';

class WeatherPresenter extends GetxController {
  late final WeatherUseCase weatherUseCase;

  WeatherPresenter({required this.weatherUseCase}) {
    print("🎯 WeatherPresenter: Constructor called");
  }

  var isLoading = true.obs;
  var errorMessage = false.obs;
  var weather = CurrentWeatherModel(
    weatherCode: 0,
    currentTemp: 0,
    windSpeed: 0,
    humidity: 0,
    rain: 0,
    pressure: 0,
    apparentTemperature: 0,
    isDay: true,
  ).obs;
  var hourlyWeather = HourlyWeatherModel(
    weatherCode: [],
    temperature: [],
    hourOfTheDay: [],
  ).obs;
  var dailyWeather = DailyWeatherModel(
    weekDays: [],
    weatherCodes: [],
    maxTemperature: [],
    minTemperature: [],
  ).obs;

  Future<void> getWeather() async {
    try {
      errorMessage(false);
      weather(await weatherUseCase.getCurrentWeather());
      hourlyWeather(await weatherUseCase.getHourlyWeather());
      dailyWeather(await weatherUseCase.getDailyWeather());
    } catch (e) {
      errorMessage(true);
      isLoading(false);
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getWeather();
  }
}
