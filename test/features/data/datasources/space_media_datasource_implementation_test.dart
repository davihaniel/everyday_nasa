import 'package:everyday_nasa/core/http_client/http_client.dart';
import 'package:everyday_nasa/core/usecase/erros/exceptions.dart';
import 'package:everyday_nasa/core/utils/converters/date_to_string_converter.dart';
import 'package:everyday_nasa/features/data/datasources/space_media_datasource.dart';
import 'package:everyday_nasa/features/data/datasources/space_media_datasource_implementation.dart';
import 'package:everyday_nasa/features/domain/entities/space_media.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/date_mock.dart';
import '../../mocks/space_media_mock.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late ISpaceMediaDatasource datasource;
  late HttpClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = NasaDatasourceImplementation(client);
  });

  final urlExpected =
      'https://api.nasa.gov/planetary/apod?hd=true&api_key=DEMO_KEY&date=${tDateTime.convert}';

  void sucessMock() {
    when(() => client.get(any())).thenAnswer(
        (_) async => HttpResponse(data: spaceMediaMock, statusCode: 200));
  }

  test('should call the get method with correct url', () async {
    sucessMock();

    await datasource.getSpaceMediaFromDate(tDateTime);

    verify(() => client.get(urlExpected)).called(1);
  });

  test('should return a SpaceMediaModel when is successful', () async {
    sucessMock();

    final tSpaceMediaModelExpected = SpaceMedia.fromJson(spaceMediaMock);

    final result = await datasource.getSpaceMediaFromDate(tDateTime);

    expect(result, tSpaceMediaModelExpected);
  });

  test('should throw a ServerException when the call is uncessful', () async {
    when(() => client.get(any()))
        .thenAnswer((_) async => HttpResponse(data: 'error', statusCode: 400));

    final result = datasource.getSpaceMediaFromDate(tDateTime);

    expect(() => result, throwsA(ServerException()));
  });
}
