import '../../../lib.dart';

abstract class IOpenWeatherMapDatasource {
  ///
  /// This method is used to get weather data from different sources such as global and local weather models, satellites, radars and a vast network of weather stations
  ///
  Future<CurrentWeatherResponseModel> getCurrentWeatherByLocation(
      {required final LocationModel location});

  ///
  /// This method is used to search weather forecast for 5 days with data every 3 hours by geographic coordinates.
  ///
  Future<ForecastWeatherResponseModel> getForecastWeatherByLocation(
      {required final LocationModel location});
}

class OpenWeatherMapDatasource implements IOpenWeatherMapDatasource {
  final IHttpClient httpClient;
  const OpenWeatherMapDatasource({required this.httpClient});

  @override
  Future<CurrentWeatherResponseModel> getCurrentWeatherByLocation(
      {required final LocationModel location}) async {
    final response = await httpClient.get('weather', queryParameters: {
      'lat': location.lat,
      'lon': location.lon,
      'appid': API_KEY
    });
    return CurrentWeatherResponseModel.fromJson(response.data);
  }

  @override
  Future<ForecastWeatherResponseModel> getForecastWeatherByLocation(
      {required final LocationModel location}) async {
    final response = await httpClient.get('forecast', queryParameters: {
      'lat': location.lat,
      'lon': location.lon,
      'appid': API_KEY
    });
    return ForecastWeatherResponseModel.fromJson(response.data);
  }
}
