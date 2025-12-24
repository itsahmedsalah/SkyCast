import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:skycast/theme/AppTheme.dart';
import 'package:skycast/theme/TextTheme.dart';
import 'package:skycast/utils/AssestsMap.dart';

Widget WeatherDetails(String icon, String info, String infoDetails) =>
    Container(
      width: 110,

      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        shape: BoxShape.rectangle,
        border: BoxBorder.all(width: 1, color: grayText.withAlpha(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(icon, width: 32, height: 32),
          SizedBox(height: 8),
          Text(infoDetails, style: medTextStyle?.copyWith(fontSize: 20)),
          Text(
            info,
            style: medTextStyle?.copyWith(color: grayText.withAlpha(80)),
          ),
        ],
      ),
    );

Widget HourlyDetail({
  required int weatherCode,
  required String time,
  required int temp,
  required bool isDay,
}) => Container(
  width: 88,
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  margin: EdgeInsets.symmetric(horizontal: 6),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(24),
    shape: BoxShape.rectangle,
    border: BoxBorder.all(width: 2, color: grayText.withAlpha(8)),
  ),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(
        weatherConditionIcon(weatherCode, isDay),
        height: 48,
        width: 46,
      ),
      const SizedBox(height: 4),
      Text(
        "$temp°C",
        style: medTextStyle?.copyWith(color: grayText.withAlpha(87)),
      ),
      const SizedBox(height: 2),
      Text(time, style: medTextStyle?.copyWith(color: grayText.withAlpha(60))),
    ],
  ),
);

Widget DailyDetails(
  int weatherCode,
  int maxTemp,
  int minTemp,
  String day,
  bool isDay,
) => Container(
  padding: EdgeInsets.symmetric(horizontal: 16),
  width: double.infinity,
  height: 62,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(day, style: medTextStyle.copyWith(color: grayText.withAlpha(80))),
      Image.asset(weatherConditionIcon(weatherCode, isDay), height: 45),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset("lib/assets/svgs/arrow_up.svg"),
          Text("$maxTemp°C", style: medTextStyle.copyWith(fontSize: 14)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 24),
            child: VerticalDivider(color: grayText.withAlpha(24), thickness: 1),
          ),
          SvgPicture.asset("lib/assets/svgs/arrow_down.svg"),
          Text("$minTemp°C", style: medTextStyle.copyWith(fontSize: 14)),
        ],
      ),
    ],
  ),
);

Widget SkyCastErrorWidget(String error) => SizedBox(
  width: double.infinity,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Lottie.asset("lib/assets/jsons/error.json"),
      Text(error, style: semiBoldTextStyle.copyWith(fontSize: 24)),
    ],
  ),
);
