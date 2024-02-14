import 'package:dartz/dartz.dart';

import '../domain.dart';

abstract class IGetCurrentWeatherByLocation {
  Future<Either<Failure, CurrentWeatherResponse>> call(
      {required final Location location});
}

class GetCurrentWeatherByLocation implements IGetCurrentWeatherByLocation {
  final IWeatherAnalyzerRepository weatherAnalyzerRepository;
  const GetCurrentWeatherByLocation({required this.weatherAnalyzerRepository});

  @override
  Future<Either<Failure, CurrentWeatherResponse>> call(
      {required final Location location}) async {
    return await weatherAnalyzerRepository.getCurrentWeatherByLocation(
      location: location,
    );
  }
}
