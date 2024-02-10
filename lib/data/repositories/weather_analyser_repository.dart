import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:weather_analyzer/lib.dart';

class WeatherAnalyserResporitory implements IWeatherAnalyserRepository {
  final IOpenWeatherMapDatasource openWeatherMapDatasource;

  WeatherAnalyserResporitory({required this.openWeatherMapDatasource});

  @override
  Future<Either<Failure, CurrentWeatherResponse>> getCurrentWeatherByLocation(
      {final Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await openWeatherMapDatasource.getCurrentWeatherByLocation();
      return right(response.toEntity());
    } on HttpException catch (e) {
      return left(ServerFailure(message: e.toString()));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, CurrentWeatherResponse>> getForecastWeatherByLocation(
      {final Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await openWeatherMapDatasource.getForecastWeatherByLocation();
      return right(response.toEntity());
    } on HttpException catch (e) {
      return left(ServerFailure(message: e.toString()));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
