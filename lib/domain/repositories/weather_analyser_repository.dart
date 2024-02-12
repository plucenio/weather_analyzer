import 'package:dartz/dartz.dart';

import '/domain/domain.dart';

abstract class IWeatherAnalyserRepository {
  Future<Either<Failure, CurrentWeatherResponse>> getCurrentWeatherByLocation(
      {required final Location location});

  Future<Either<Failure, ForecastWeatherResponse>> getForecastWeatherByLocation(
      {required final Location location});
}
