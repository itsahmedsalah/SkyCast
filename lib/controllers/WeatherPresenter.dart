import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:skycast/data/LocationService.dart';
import 'package:skycast/domain/model/entity/CurrentWeatherModel.dart';
import 'package:skycast/domain/model/entity/DailyWeatherModel.dart';
import 'package:skycast/domain/model/entity/HourlyWeatherModel.dart';
import 'package:skycast/domain/usecases/WeatherUseCase.dart';

class WeatherPresenter extends GetxController {
  late final WeatherUseCase weatherUseCase;
  late final LocationService locationService;

  WeatherPresenter({
    required this.weatherUseCase,
    required this.locationService,
  }) {
    print("🎯 WeatherPresenter: Constructor called");
  }

  var isLoading = true.obs;
  var errorMessage = "".obs;
  var city = "Loading...".obs;
  var country = "".obs;

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
      isLoading(true);
      errorMessage("");

      // Get current location
      Position position = await locationService.getCurrentLocation();

      // Get city and country
      String? cityName = await locationService.getCityFromCoordinates(
        position.latitude,
        position.longitude,
      );
      String? countryName = await locationService.getCountryFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (cityName != null) city.value = cityName;
      if (countryName != null) country.value = countryName;

      // Fetch weather with dynamic coordinates
      weather(
        await weatherUseCase.getCurrentWeather(
          position.latitude,
          position.longitude,
        ),
      );
      hourlyWeather(
        await weatherUseCase.getHourlyWeather(
          position.latitude,
          position.longitude,
        ),
      );
      dailyWeather(
        await weatherUseCase.getDailyWeather(
          position.latitude,
          position.longitude,
        ),
      );
    } catch (e) {
      print("Error fetching weather: $e");
      errorMessage("Location Is Needed");
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
