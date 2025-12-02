import 'package:dio/dio.dart';
import 'package:skycast/data/DataModel/CurrentWeatherDTO.dart';
import 'package:skycast/data/DataModel/DailyWeatherDTO.dart';
import 'package:skycast/data/DataModel/HourlyWeatherDTO.dart';
import 'package:skycast/data/Mapper/WeatherMapper.dart';
import 'package:skycast/domain/model/entity/CurrentWeatherModel.dart';
import 'package:skycast/domain/model/entity/DailyWeatherModel.dart';
import 'package:skycast/domain/model/entity/HourlyWeatherModel.dart';
import 'package:skycast/domain/repository/WeatherRepository.dart';

class WeatherDataSource implements WeatherRepository {
  final dio = Dio();
  late String baseUrl;
  late String hourlyUrl;
  late String dailyUrl;

  WeatherDataSource(double longitude, double latitude) {
    baseUrl =
        "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,rain,weather_code,surface_pressure,wind_speed_10m";
    hourlyUrl =
        "https://api.open-meteo.com/v1/forecast"
        "?latitude=$latitude&longitude=$longitude"
        "&hourly=apparent_temperature,weather_code";
    dailyUrl =
        "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=${longitude}&daily=weather_code,temperature_2m_max,temperature_2m_min";
  }

  @override
  Future<CurrentWeatherModel> getCurrentWeather() async {
    final response = await dio.get(baseUrl);
    print(CurrentWeatherDto.fromJson(response.data).current);
    if (response.statusCode == 200) {
      return CurrentWeatherDto.fromJson(response.data).toModel();
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }

  @override
  Future<HourlyWeatherModel> getHourlyWeather() async {
    final response = await dio.get(hourlyUrl);

    if (response.statusCode == 200) {
      return HourlyWeatherDto.fromJson(response.data).toModel();
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }

  @override
  Future<DailyWeatherModel> getDailyWeather() async{
    final response = await dio.get(dailyUrl);

    if (response.statusCode == 200) {
      return DailyWeatherDto.fromJson(response.data).toModel();
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }
}

void main() async {
  var hjhh = WeatherDataSource(30, 30);
  var ccc = await hjhh.getDailyWeather();
   print(ccc.maxTemperature);
}
