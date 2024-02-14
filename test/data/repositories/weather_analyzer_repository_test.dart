import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_analyzer/lib.dart';

class MockDatasource extends Mock implements IOpenWeatherMapDatasource {}

void main() {
  late MockDatasource mockDatasource;
  late IWeatherAnalyserRepository repository;

  setUp(() {
    mockDatasource = MockDatasource();
    repository =
        WeatherAnalyserRepository(openWeatherMapDatasource: mockDatasource);
  });

  //TODO: fix this test
  group(
    'getCurrentWeatherByLocation',
    () {
      test(
          'should return a WeatherAnalysis when the call to datasource is successful',
          () async {
        // Arrange
        final location = Location(lat: '10.0', lon: '10.0');
        final currentWeatherResponse = CurrentWeatherResponseModel(
          id: 10,
          name: 'name',
          cod: 20,
        );
        when(
          () => mockDatasource.getCurrentWeatherByLocation(
            location: LocationModel.fromEntity(location),
          ),
        ).thenAnswer((final _) async => currentWeatherResponse);

        // Act
        final result =
            await repository.getCurrentWeatherByLocation(location: location);

        // Assert
        expect(result, isA<CurrentWeatherResponseModel>());
        verify(
          () => mockDatasource.getCurrentWeatherByLocation(
            location: LocationModel.fromEntity(location),
          ),
        ).called(1);
      });
    },
  );
}
