import 'package:dartz/dartz.dart';
import 'package:weather_analyzer/lib.dart';

class CitiesConfigurationRespository implements ICitiesConfigurationRepository {
  final IReaderDatasource readerDatasource;

  CitiesConfigurationRespository({required this.readerDatasource});

  @override
  Future<Either<Failure, List<City>>> getCities() async {
    try {
      final result = await readerDatasource.readCities();
      if (result.isNotEmpty) {
        return right(result.map((final e) => e.toEntity()).toList());
      }
      return left(UnprocessableEntityFailure(message: 'Cannot get cities.'));
    } catch (e) {
      return left(Failure(message: 'An error was ocurred.'));
    }
  }
}
