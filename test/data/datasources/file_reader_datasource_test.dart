import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_analyzer/lib.dart';

class MockAssetBundle extends Mock implements IRootBundleAdapter {}

void main() {
  late MockAssetBundle mockAssetBundle;
  late IFileReaderDatasource datasource;

  setUp(() {
    mockAssetBundle = MockAssetBundle();
    datasource = FileReaderDatasource(rootBundleAdapter: mockAssetBundle);
  });

  group(
    'FileReaderDatasource Tests',
    () {
      test(
        'should return an empty list when the call to API is empty',
        () async {
          // Arrange
          const String expectedResponse = "{}";
          when(
            () => mockAssetBundle.loadString(
              key: any(named: 'key'),
            ),
          ).thenAnswer(
            (final invocation) async => expectedResponse.toString(),
          );

          // Act
          final result = await datasource.readCities();

          // Assert
          expect(result, isA<List<CityModel>>());
          expect(result, []);
          verify(() => mockAssetBundle.loadString(key: any(named: 'key')))
              .called(1);
        },
      );

      test(
        'should return an empty list when the call to API is empty',
        () async {
          // Arrange
          const String expectedResponse =
              '{"data":[{"name": "Silverston","country": "United Kingdom","lat": "52.0738","lng": "-1.0168"}]}';
          when(
            () => mockAssetBundle.loadString(
              key: any(named: 'key'),
            ),
          ).thenAnswer(
            (final invocation) async => expectedResponse,
          );

          // Act
          final result = await datasource.readCities();

          // Assert
          expect(result, isA<List<CityModel>>());
          expect(
            result,
            <CityModel>[
              CityModel(
                name: 'Silverston',
                country: 'United Kingdom',
                lat: '52.0738',
                lng: '-1.0168',
              )
            ],
          );
          verify(() => mockAssetBundle.loadString(key: any(named: 'key')))
              .called(1);
        },
      );
    },
  );
}
