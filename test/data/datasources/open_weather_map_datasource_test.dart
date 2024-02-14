import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_analyzer/lib.dart';

class MockHttpClient extends Mock implements IHttpClient {}

void main() {
  late MockHttpClient mockHttpClient;
  late OpenWeatherMapDatasource datasource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    datasource = OpenWeatherMapDatasource(httpClient: mockHttpClient);
  });

  group(
    'OpenWeatherMapDatasource Tests',
    () {
      test(
        'should return CurrentWeatherResponse when the call to API is successful',
        () async {
          // Arrange
          const int id = 1;
          const int visibility = 2;
          final Map<String, dynamic> expectedResponse = {
            'id': id,
            'visibility': visibility,
            'weather': [
              {
                'id': 800,
                'main': 'Clear',
                'description': 'clear sky',
                'icon': '01d'
              }
            ],
          };
          when(
            () => mockHttpClient.get(
              any(),
              queryParameters: any(named: 'queryParameters'),
              options: any(named: 'options'),
            ),
          ).thenAnswer(
            (final invocation) async => Response(
              data: expectedResponse,
              requestOptions: RequestOptions(),
            ),
          );

          // Act
          final result = await datasource.getCurrentWeatherByLocation(
              location: LocationModel());

          // Assert
          expect(result, isA<CurrentWeatherResponseModel>());
          expect(result.id, id);
          expect(result.visibility, visibility);
          verify(() => mockHttpClient.get(any(),
              queryParameters: any(named: 'queryParameters'),
              options: any(named: 'options'))).called(1);
        },
      );

      test(
        'should return ForecastWeatherResponse when the call to API is successful',
        () async {
          // Arrange
          const String cod = '1';
          const int message = 1;
          final Map<String, dynamic> expectedResponse = {
            'cod': cod,
            'message': message,
            'weather': [
              {
                'id': 800,
                'main': 'Clear',
                'description': 'clear sky',
                'icon': '01d'
              }
            ],
          };
          when(
            () => mockHttpClient.get(
              any(),
              queryParameters: any(named: 'queryParameters'),
              options: any(named: 'options'),
            ),
          ).thenAnswer(
            (final invocation) async => Response(
              data: expectedResponse,
              requestOptions: RequestOptions(),
            ),
          );

          // Act
          final result = await datasource.getForecastWeatherByLocation(
              location: LocationModel());

          // Assert
          expect(result, isA<ForecastWeatherResponseModel>());
          expect(result.cod, cod);
          expect(result.message, message);
          verify(() => mockHttpClient.get(any(),
              queryParameters: any(named: 'queryParameters'),
              options: any(named: 'options'))).called(1);
        },
      );
    },
  );
}
