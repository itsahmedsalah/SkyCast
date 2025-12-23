import 'package:get/get.dart';
import 'package:skycast/data/LocationService.dart';
import 'package:skycast/controllers/WeatherPresenter.dart';
import 'package:skycast/data/WeatherDataSource.dart';
import 'package:skycast/domain/repository/WeatherRepository.dart';
import 'package:skycast/domain/usecases/WeatherUseCase.dart';

class WeatherBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<LocationService>(LocationService(), permanent: true);
    Get.put<WeatherRepository>(
      WeatherDataSource(),
      permanent: true,
    );
    Get.put<WeatherUseCase>(WeatherUseCase(Get.find()), permanent: true);
    Get.put<WeatherPresenter>(
      WeatherPresenter(weatherUseCase: Get.find(), locationService: Get.find()),
      permanent: true,
    );
  }
}
