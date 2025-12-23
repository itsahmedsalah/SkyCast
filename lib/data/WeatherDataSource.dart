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

  String _buildUrl(double lat, double lon, String params) {
    return "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$lon&$params";
  }

  @override
  Future<CurrentWeatherModel> getCurrentWeather(double lat, double lon) async {
    final url = _buildUrl(lat, lon, "current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,rain,weather_code,surface_pressure,wind_speed_10m");
    final response = await dio.get(url);
    print(CurrentWeatherDto.fromJson(response.data).current);
    if (response.statusCode == 200) {
      return CurrentWeatherDto.fromJson(response.data).toModel();
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }

  @override
  Future<HourlyWeatherModel> getHourlyWeather(double lat, double lon) async {
    final url = _buildUrl(lat, lon, "hourly=apparent_temperature,weather_code");
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      return HourlyWeatherDto.fromJson(response.data).toModel();
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }

  @override
  Future<DailyWeatherModel> getDailyWeather(double lat, double lon) async {
    final url = _buildUrl(lat, lon, "daily=weather_code,temperature_2m_max,temperature_2m_min");
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      return DailyWeatherDto.fromJson(response.data).toModel();
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  }
}

