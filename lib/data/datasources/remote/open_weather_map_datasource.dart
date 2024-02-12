import '../../../lib.dart';

abstract class IOpenWeatherMapDatasource {
  ///
  /// This method is used to get weather data from different sources such as global and local weather models, satellites, radars and a vast network of weather stations
  ///
  Future<CurrentWeatherResponseModel> getCurrentWeatherByLocation(
      {final Map<String, dynamic>? queryParameters});

  ///
  /// This method is used to search weather forecast for 5 days with data every 3 hours by geographic coordinates.
  ///
  Future<ForecastWeatherResponseModel> getForecastWeatherByLocation(
      {final Map<String, dynamic>? queryParameters});
}

class OpenWeatherMapDatasource implements IOpenWeatherMapDatasource {
  final IHttpClient httpClient;
  const OpenWeatherMapDatasource({required this.httpClient});

  @override
  Future<CurrentWeatherResponseModel> getCurrentWeatherByLocation(
      {final Map<String, dynamic>? queryParameters}) async {
    //TODO: requisitar esse parametro obrigatoriamente.
    final response = await httpClient.get('weather',
        queryParameters: {'lat': '33.44', 'lon': '-94.04', 'appid': API_KEY});
    return CurrentWeatherResponseModel.fromJson(response.data);
  }

  @override
  Future<ForecastWeatherResponseModel> getForecastWeatherByLocation(
      {final Map<String, dynamic>? queryParameters}) async {
    //TODO: requisitar esse parametro obrigatoriamente.
    final response = await httpClient.get('forecast',
        queryParameters: {'lat': '33.44', 'lon': '-94.04', 'appid': API_KEY});
    return ForecastWeatherResponseModel.fromJson(response.data);
  }
}
