import 'package:dartz/dartz.dart';
import 'package:everyday_nasa/core/usecase/erros/exceptions.dart';
import 'package:everyday_nasa/core/usecase/erros/failures.dart';
import 'package:everyday_nasa/features/data/datasources/space_media_datasource.dart';
import 'package:everyday_nasa/features/data/repositories/space_media_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/date_mock.dart';
import '../../mocks/space_media_model_mock.dart';
class MockSpaceMediaDatasource extends Mock implements ISpaceMediaDatasource {}

void main() {
  late SpaceMediaRepositoryImplementation repository;
  late ISpaceMediaDatasource datasource;

  setUp(() {
    datasource = MockSpaceMediaDatasource();
    repository = SpaceMediaRepositoryImplementation(datasource);
  });

  test('should return space media model when calls the datasource', () async {
    when(() => datasource.getSpaceMediaFromDate(any()))
        .thenAnswer((_) async => tSpaceMediaModel);

    final result = await repository.getSpaceMediaFromDate(tDateTime);

    expect(result, const Right(tSpaceMediaModel));
    verify(() => datasource.getSpaceMediaFromDate(tDateTime)).called(1);
  });

  test(
      'should return a server failure when the call to datasource is unsucessfull',
      () async {
    when(() => datasource.getSpaceMediaFromDate(any()))
        .thenThrow(ServerException());

    final result = await repository.getSpaceMediaFromDate(tDateTime);

    expect(result, Left(ServerFailure()));
    verify(() => datasource.getSpaceMediaFromDate(tDateTime)).called(1);
  });
}
