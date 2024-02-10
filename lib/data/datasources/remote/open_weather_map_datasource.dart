import 'package:dio/dio.dart';

import '../../data.dart';

abstract class IOpenWeatherMapDatasource {
  Future<CurrentWeatherResponse> getCurrentWeatherByLocation();
}

class OpenWeatherMapDatasource implements IOpenWeatherMapDatasource {
  final Dio dio;
  OpenWeatherMapDatasource({required this.dio});

  @override
  Future<CurrentWeatherResponse> getCurrentWeatherByLocation() async {
    final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?',
        queryParameters: {
          'lat': '33.44',
          'lon': '-94.04',
          'appid': '81ee26cd0ef525be11a625fac41650cf',
        });
    return CurrentWeatherResponse.fromJson(response.data);
  }
}
