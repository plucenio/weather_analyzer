import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_analyzer/lib.dart';

class MockWeatherAnalyzerRepository extends Mock
    implements IWeatherAnalyzerRepository {}

void main() {
  late IGetForecastWeatherByLocation usecase;
  late MockWeatherAnalyzerRepository mockWeatherAnalyzerRepository;

  setUp(() {
    mockWeatherAnalyzerRepository = MockWeatherAnalyzerRepository();
    usecase = GetForecastWeatherByLocation(
        weatherAnalyzerRepository: mockWeatherAnalyzerRepository);
  });

  test(
    'should get forecast weather for the location from the repository',
    () async {
      // Arrange
      final location = Location(lat: '10.0', lon: '10.0');
      final forecastWeatherResponse = ForecastWeatherResponse(
        cod: 'cod',
        message: 1,
        cnt: 2,
      );
      when(
        () => mockWeatherAnalyzerRepository.getForecastWeatherByLocation(
          location: location,
        ),
      ).thenAnswer((final _) async => right(forecastWeatherResponse));

      // Act
      final result = (await usecase.call(location: location)).fold(
        (final l) => l,
        (final r) => r,
      );

      // Assert
      expect(result, isA<ForecastWeatherResponse>());
      expect(result, forecastWeatherResponse);
      verify(() => mockWeatherAnalyzerRepository.getForecastWeatherByLocation(
          location: location)).called(1);
      verifyNoMoreInteractions(mockWeatherAnalyzerRepository);
    },
  );

  test(
    'should return failure when there is no forecast weather data for the location',
    () async {
      // Arrange
      final location = Location(lat: '10.0', lon: '10.0');
      final failure = ServerFailure(message: 'Failed to fetch weather data');
      when(
        () => mockWeatherAnalyzerRepository.getForecastWeatherByLocation(
          location: location,
        ),
      ).thenAnswer((final _) async => left(failure));

      // Act
      final result = (await usecase.call(location: location)).fold(
        (final l) => l,
        (final r) => r,
      );

      // Assert
      expect(result, failure);
      verify(() => mockWeatherAnalyzerRepository.getForecastWeatherByLocation(
          location: location)).called(1);
      verifyNoMoreInteractions(mockWeatherAnalyzerRepository);
    },
  );
}
