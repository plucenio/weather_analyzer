import 'package:dartz/dartz.dart';

import '../domain.dart';

abstract class IGetCurrentWeatherByLocation {
  Future<Either<Failure, CurrentWeatherResponse>> call(
      {required final Location location});
}

class GetCurrentWeatherByLocation implements IGetCurrentWeatherByLocation {
  final IWeatherAnalyserRepository weatherAnalyserRepository;
  const GetCurrentWeatherByLocation({required this.weatherAnalyserRepository});

  @override
  Future<Either<Failure, CurrentWeatherResponse>> call(
      {required final Location location}) async {
    return await weatherAnalyserRepository.getCurrentWeatherByLocation(
      location: location,
    );
  }
}
