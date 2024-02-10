import 'package:dartz/dartz.dart';

import '../../lib.dart';

abstract class ICitiesConfigurationRepository {
  Future<Either<Failure, List<City>>> getCities();
}
