import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skycast/controllers/WeatherPresenter.dart';
import 'package:skycast/domain/model/entity/CurrentWeatherModel.dart';
import 'package:skycast/theme/AppTheme.dart';
import 'package:skycast/theme/TextTheme.dart';
import 'package:skycast/ui/Widgets.dart';
import 'package:skycast/utils/AssestsMap.dart';
import 'package:skycast/utils/WeatherStringMap.dart';

class Homescreen extends GetView<WeatherPresenter> {
  Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: lightGradient,
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  if (controller.isLoading.value) {
                    return const CircularProgressIndicator();
                  }

                  if (controller.errorMessage.value) {
                    return const Text("Error loading weather");
                  }

                  return WeatherContent(controller.weather.value);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget WeatherContent(CurrentWeatherModel currentWeather) {
    return Padding(
      padding: EdgeInsetsGeometry.only(top: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  "lib/assets/svgs/location.svg",
                  width: 24,
                  height: 24,
                ),
                Text("Cairo", style: medTextStyle),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            width: 220,
            child: Image.asset(
              weatherConditionIcon(
                currentWeather.weatherCode,
                currentWeather.isDay,
              ),
            ),
          ),
          Text("${currentWeather.currentTemp}°C", style: semiBoldTextStyle),
          Text(
            WeatherConditionText.readable(currentWeather.weatherCode),
            style: medTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(100),
                color: grayText.withAlpha(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset("lib/assets/svgs/arrow_up.svg"),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, right: 8),
                    child: Text(
                      "${currentWeather.currentTemp}°C",
                      style: medTextStyle,
                    ),
                  ),
                  Container(height: 14, width: 1, color: grayText),
                  SizedBox(width: 4),
                  SvgPicture.asset("lib/assets/svgs/arrow_down.svg"),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, right: 8),
                    child: Text(
                      "${currentWeather.currentTemp}°C",
                      style: medTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 6,
            children: [
              WeatherDetails(
                "lib/assets/svgs/fast-wind.svg",
                "Wind",
                "${currentWeather.windSpeed} KM/h",
              ),
              WeatherDetails(
                "lib/assets/svgs/humidity.svg",
                "Humidity",
                "${currentWeather.humidity}%",
              ),
              WeatherDetails(
                "lib/assets/svgs/rain.svg",
                "Rain",
                "${currentWeather.rain}%",
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 6,
            children: [
              WeatherDetails(
                "lib/assets/svgs/uv-02.svg",
                "UV Index",
                "${currentWeather.windSpeed}",
              ),
              WeatherDetails(
                "lib/assets/svgs/arrow_down2.svg",
                "Pressure",
                "${currentWeather.pressure} hPa",
              ),
              WeatherDetails(
                "lib/assets/svgs/temperature.svg",
                "Rain",
                "${currentWeather.apparentTemperature}%",
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 24, bottom: 12, left: 12, right: 12),
            child: Text(
              "Today",
              style: semiBoldTextStyle.copyWith(fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.hourlyWeather.value.temperature.length,
              itemBuilder: (context, index) => HourlyDetail(
                isDay: currentWeather.isDay,
                weatherCode: controller.hourlyWeather.value.weatherCode[index],
                temp: controller.hourlyWeather.value.temperature[index],
                time: controller.hourlyWeather.value.hourOfTheDay[index],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 24, bottom: 12, left: 12, right: 12),
            child: Text(
              "Next 7 days",
              style: semiBoldTextStyle.copyWith(fontSize: 20),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: BoxBorder.all(color: Colors.grey.withAlpha(50), width: 1),
              borderRadius: BorderRadius.circular(24),
            ),
            margin: EdgeInsets.symmetric(horizontal: 12),
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ListView.separated(
              separatorBuilder: (context,index)=>Divider(
                color: Colors.grey.withAlpha(50),
                height: 10,
                thickness: 1,
              ),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.dailyWeather.value.weekDays.length,
              itemBuilder: (context, index) => DailyDetails(
                controller.dailyWeather.value.weatherCodes[index],
                controller.dailyWeather.value.maxTemperature[index],
                controller.dailyWeather.value.minTemperature[index],
                controller.dailyWeather.value.weekDays[index],
                currentWeather.isDay,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
