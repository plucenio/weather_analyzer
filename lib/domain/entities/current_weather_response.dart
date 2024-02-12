import '../domain.dart';

class CurrentWeatherResponse {
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Wind? wind;
  Rain1h? rain;
  Clouds? clouds;
  int? dt;
  CurrentSys? sys;
  int? timezone;
  int? id;
  String? name;
  int? cod;

  CurrentWeatherResponse(
      {this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.rain,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});
}
