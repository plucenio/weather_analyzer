import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:weather_analyzer/lib.dart';

class WeatherAnalyserResporitory implements IWeatherAnalyserRepository {
  final IOpenWeatherMapDatasource openWeatherMapDatasource;

  WeatherAnalyserResporitory({required this.openWeatherMapDatasource});

  @override
  Future<Either<Failure, CurrentWeatherResponse>> getCurrentWeatherByLocation(
      {required final Location location}) async {
    try {
      final response =
          await openWeatherMapDatasource.getCurrentWeatherByLocation(
        location: LocationModel.fromEntity(location),
      );
      return right(response.toEntity());
    } on HttpException catch (e) {
      return left(ServerFailure(message: e.toString()));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ForecastWeatherResponse>> getForecastWeatherByLocation(
      {required final Location location}) async {
    try {
      final response =
          await openWeatherMapDatasource.getForecastWeatherByLocation(
        location: LocationModel.fromEntity(location),
      );
      return right(response.toEntity());
    } on HttpException catch (e) {
      return left(ServerFailure(message: e.toString()));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
