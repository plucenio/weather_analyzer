import 'entities.dart';

class Date {
  int? dt;
  Main? main;
  List<Weather>? weather;
  Clouds? clouds;
  Wind? wind;
  int? visibility;
  String? pop;
  Rain3h? rain;
  ForecastSys? sys;
  String? dtTxt;

  Date(
      {this.dt,
      this.main,
      this.weather,
      this.clouds,
      this.wind,
      this.visibility,
      this.pop,
      this.rain,
      this.sys,
      this.dtTxt});
}
