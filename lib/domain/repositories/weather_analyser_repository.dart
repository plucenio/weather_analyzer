import 'package:dartz/dartz.dart';

import '/domain/domain.dart';

abstract class IWeatherAnalyserRepository {
  Future<Either<Failure, CurrentWeatherResponse>> getCurrentWeatherByLocation(
      {final Map<String, dynamic>? queryParameters});

  Future<Either<Failure, CurrentWeatherResponse>> getForecastWeatherByLocation(
      {final Map<String, dynamic>? queryParameters});
}
