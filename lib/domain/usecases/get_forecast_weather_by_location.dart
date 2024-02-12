import 'package:dartz/dartz.dart';

import '../domain.dart';

abstract class IGetForecastWeatherByLocation {
  Future<Either<Failure, ForecastWeatherResponse>> call(
      {required final Location location});
}

class GetForecastWeatherByLocation implements IGetForecastWeatherByLocation {
  final IWeatherAnalyserRepository weatherAnalyserRepository;
  const GetForecastWeatherByLocation({required this.weatherAnalyserRepository});

  @override
  Future<Either<Failure, ForecastWeatherResponse>> call(
      {required final Location location}) async {
    return await weatherAnalyserRepository.getForecastWeatherByLocation(
      location: location,
    );
  }
}
