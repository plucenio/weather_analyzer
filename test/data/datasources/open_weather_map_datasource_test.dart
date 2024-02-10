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
          final Map<String, dynamic> queryParameters = {'q': 'London'};
          final Map<String, dynamic> expectedResponse = {
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
              queryParameters: queryParameters);

          // Assert
          expect(result, isA<CurrentWeatherResponse>());
          verify(() => mockHttpClient.get(any(),
              queryParameters: any(named: 'queryParameters'),
              options: any(named: 'options'))).called(1);
        },
      );
    },
  );
}
