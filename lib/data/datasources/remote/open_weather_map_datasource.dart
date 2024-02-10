import '../../../lib.dart';

abstract class IOpenWeatherMapDatasource {
  Future<CurrentWeatherResponse> getCurrentWeatherByLocation();
}

class OpenWeatherMapDatasource implements IOpenWeatherMapDatasource {
  final IHttpClient httpClient;
  const OpenWeatherMapDatasource({required this.httpClient});

  @override
  Future<CurrentWeatherResponse> getCurrentWeatherByLocation() async {
    final response = await httpClient.get('weather', queryParameters: {
      'lat': '33.44',
      'lon': '-94.04',
      'appid': '81ee26cd0ef525be11a625fac41650cf'
    });
    return CurrentWeatherResponse.fromJson(response.data);
  }
}
