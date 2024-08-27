import 'package:dartz/dartz.dart';
import 'package:everyday_nasa/core/usecase/erros/failures.dart';
import 'package:everyday_nasa/features/domain/entities/space_media_entity.dart';
import 'package:everyday_nasa/features/domain/repositories/space_media_repository.dart';
import 'package:everyday_nasa/features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/date_mock.dart';
import '../../mocks/space_media_entity_mock.dart';

class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository {}

void main() {
  late GetSpaceMediaFromDateUsecase usecase;
  late ISpaceMediaRepository repository;

  setUp(() {
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaFromDateUsecase(repository);
  });

  test('should get space media entity for a¢ given date from the respository',
      () async {
    when(() => repository.getSpaceMediaFromDate(any())).thenAnswer(
        (_) async => const Right<Failure, SpaceMediaEntity>(tSpaceMedia));

    final result = await usecase(tDateTime);

    expect(result, const Right(tSpaceMedia));
    verify(() => repository.getSpaceMediaFromDate(tDateTime)).called(1);
  });

  test('should return a Failure when don\'t succeed', () async {
    when(() => repository.getSpaceMediaFromDate(any())).thenAnswer(
        (_) async => Left<Failure, SpaceMediaEntity>(ServerFailure()));

    final result = await usecase(tDateTime);

    expect(result, Left(ServerFailure()));
    verify(() => repository.getSpaceMediaFromDate(tDateTime)).called(1);
  });

  test('should return a NullParamFailure when receives a null param', () async {

    final result = await usecase(null);

    expect(result, Left(NullParamFailure()));
    verifyNever(() => repository.getSpaceMediaFromDate(tDateTime));
  });
}
