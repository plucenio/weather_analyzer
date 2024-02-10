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
  Future<CurrentWeatherResponseModel> getForecastWeatherByLocation(
      {final Map<String, dynamic>? queryParameters});
}

class OpenWeatherMapDatasource implements IOpenWeatherMapDatasource {
  final IHttpClient httpClient;
  const OpenWeatherMapDatasource({required this.httpClient});

  @override
  Future<CurrentWeatherResponseModel> getCurrentWeatherByLocation(
      {final Map<String, dynamic>? queryParameters}) async {
    final response = await httpClient.get('weather', queryParameters: {
      'lat': '33.44',
      'lon': '-94.04',
      'appid': '81ee26cd0ef525be11a625fac41650cf'
    });
    return CurrentWeatherResponseModel.fromJson(response.data);
  }

  @override
  Future<CurrentWeatherResponseModel> getForecastWeatherByLocation(
      {final Map<String, dynamic>? queryParameters}) async {
    final response = await httpClient.get('forecast', queryParameters: {
      'lat': '33.44',
      'lon': '-94.04',
      'appid': '81ee26cd0ef525be11a625fac41650cf'
    });
    return CurrentWeatherResponseModel.fromJson(response.data);
  }
}
