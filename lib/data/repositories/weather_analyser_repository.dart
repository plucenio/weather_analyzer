import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:weather_analyzer/lib.dart';

import '../../domain/domain.dart';

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
      return left(ServerFailure(e.toString()));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
