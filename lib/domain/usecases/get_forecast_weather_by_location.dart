import 'package:dartz/dartz.dart';

import '../domain.dart';

abstract class IGetForecastWeatherByLocation {
  Future<Either<Failure, ForecastWeatherResponse>> call(
      {required final Location location});
}

class GetForecastWeatherByLocation implements IGetForecastWeatherByLocation {
  final IWeatherAnalyzerRepository weatherAnalyzerRepository;
  const GetForecastWeatherByLocation({required this.weatherAnalyzerRepository});

  @override
  Future<Either<Failure, ForecastWeatherResponse>> call(
      {required final Location location}) async {
    return await weatherAnalyzerRepository.getForecastWeatherByLocation(
      location: location,
    );
  }
}
