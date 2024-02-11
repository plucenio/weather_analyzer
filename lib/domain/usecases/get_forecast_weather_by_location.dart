import 'package:dartz/dartz.dart';

import '../domain.dart';

abstract class IGetForecastWeatherByLocation {
  Future<Either<Failure, ForecastWeatherResponse>> call(
      {final Map<String, dynamic>? queryParameters});
}

class GetForecastWeatherByLocation implements IGetForecastWeatherByLocation {
  final IWeatherAnalyserRepository weatherAnalyserRepository;
  const GetForecastWeatherByLocation({required this.weatherAnalyserRepository});

  @override
  Future<Either<Failure, ForecastWeatherResponse>> call(
      {final Map<String, dynamic>? queryParameters}) async {
    return await weatherAnalyserRepository.getForecastWeatherByLocation();
  }
}
