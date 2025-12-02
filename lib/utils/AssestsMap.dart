String weatherConditionIcon(int code, bool isDay) {
  String prefix = isDay ? "lib/assets/day_icons/light_"
      : "lib/assets/night_icons/night_";

  switch (code) {
    case 0:
      return "${prefix}clear_sky.png";

    case 1:
      return "${prefix}mainly_clear.png";

    case 2:
      return "${prefix}partly_cloudy.png";

    case 3:
      return "${prefix}overcast.png";

    case 45:
      return "${prefix}fog.png";

    case 48:
      return "${prefix}depositing_rime_fog.png";

    case 51:
      return "${prefix}drizzle_light.png";

    case 53:
      return "${prefix}drizzle_moderate.png";

    case 55:
      return "${prefix}drizzle_dense.png";

    case 56:
      return "${prefix}freezing_drizzle_light.png";

    case 57:
      return "${prefix}freezing_drizzle_intense.png";

    case 61:
      return "${prefix}rain_slight.png";

    case 63:
      return "${prefix}rain_moderate.png";

    case 65:
      return "${prefix}rain_heavy.png";

    case 66:
      return "${prefix}freezing_rain_light.png";

    case 67:
      return "${prefix}freezing_rain_heavy.png";

    case 71:
      return "${prefix}snow_fall_slight.png";

    default:
      return "${prefix}clear_sky.png";
  }
}

void main(){
  print(weatherConditionIcon(1, true));
}