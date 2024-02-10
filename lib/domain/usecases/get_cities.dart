import 'package:dartz/dartz.dart';

import '../../lib.dart';

abstract class IGetCities {
  Future<Either<Failure, List<City>>> call();
}

class GetCities implements IGetCities {
  final ICitiesConfigurationRepository citiesConfigurationRepository;
  GetCities({
    required this.citiesConfigurationRepository,
  });

  @override
  Future<Either<Failure, List<City>>> call() async {
    return citiesConfigurationRepository.getCities();
  }
}
