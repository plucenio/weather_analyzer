import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:weather_analyzer/lib.dart';

class WeatherAnalyzerRepository implements IWeatherAnalyzerRepository {
  final IOpenWeatherMapDatasource openWeatherMapDatasource;

  WeatherAnalyzerRepository({required this.openWeatherMapDatasource});

  @override
  Future<Either<Failure, CurrentWeatherResponse>> getCurrentWeatherByLocation(
      {required final Location location}) async {
    try {
      final response =
          await openWeatherMapDatasource.getCurrentWeatherByLocation(
        location: LocationModel.fromEntity(location),
      );
      return Right(response.toEntity());
    } on HttpException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    } catch (e) {
      return Left(Failure(message: e.toString()));
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
      return Right(response.toEntity());
    } on HttpException catch (e) {
      return Left(ServerFailure(message: e.toString()));
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
