import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_analyzer/lib.dart';

class MockWeatherAnalyzerRepository extends Mock
    implements IWeatherAnalyzerRepository {}

void main() {
  late IGetCurrentWeatherByLocation usecase;
  late MockWeatherAnalyzerRepository mockWeatherAnalyzerRepository;

  setUp(() {
    mockWeatherAnalyzerRepository = MockWeatherAnalyzerRepository();
    usecase = GetCurrentWeatherByLocation(
        weatherAnalyzerRepository: mockWeatherAnalyzerRepository);
  });

  test(
    'should get current weather for the location from the repository',
    () async {
      // Arrange
      final location = Location(lat: '10.0', lon: '10.0');
      final currentWeatherResponse = CurrentWeatherResponse(
        id: 10,
        name: 'name',
        cod: 10,
      );
      when(
        () => mockWeatherAnalyzerRepository.getCurrentWeatherByLocation(
          location: location,
        ),
      ).thenAnswer((final _) async => right(currentWeatherResponse));

      // Act
      final result = (await usecase.call(location: location)).fold(
        (final l) => l,
        (final r) => r,
      );

      // Assert
      expect(result, isA<CurrentWeatherResponse>());
      expect(result, currentWeatherResponse);
      verify(() => mockWeatherAnalyzerRepository.getCurrentWeatherByLocation(
          location: location)).called(1);
      verifyNoMoreInteractions(mockWeatherAnalyzerRepository);
    },
  );

  test(
    'should return failure when there is no current weather data for the location',
    () async {
      // Arrange
      final location = Location(lat: '10.0', lon: '10.0');
      final failure = ServerFailure(message: 'Failed to fetch weather data');
      when(
        () => mockWeatherAnalyzerRepository.getCurrentWeatherByLocation(
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
      verify(() => mockWeatherAnalyzerRepository.getCurrentWeatherByLocation(
          location: location)).called(1);
      verifyNoMoreInteractions(mockWeatherAnalyzerRepository);
    },
  );
}
