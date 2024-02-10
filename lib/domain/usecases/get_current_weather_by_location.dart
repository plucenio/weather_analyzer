import 'package:dartz/dartz.dart';

import '../domain.dart';

abstract class IGetCurrentWeatherByLocation {
  Future<Either<Failure, CurrentWeatherResponse>> call(
      {final Map<String, dynamic>? queryParameters});
}

class GetCurrentWeatherByLocation implements IGetCurrentWeatherByLocation {
  final IWeatherAnalyserRepository weatherAnalyserRepository;
  const GetCurrentWeatherByLocation({required this.weatherAnalyserRepository});

  @override
  Future<Either<Failure, CurrentWeatherResponse>> call(
      {final Map<String, dynamic>? queryParameters}) async {
    return await weatherAnalyserRepository.getCurrentWeatherByLocation();
  }
}
