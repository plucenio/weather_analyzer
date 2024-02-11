import 'entities.dart';

class ForecastWeatherResponse {
  String? cod;
  int? message;
  int? cnt;
  List<Date>? list;
  CityResponse? city;

  ForecastWeatherResponse(
      {this.cod, this.message, this.cnt, this.list, this.city});
}
