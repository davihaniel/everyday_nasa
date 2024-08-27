import 'package:dartz/dartz.dart';
import 'package:everyday_nasa/core/usecase/erros/failures.dart';
import 'package:everyday_nasa/features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:everyday_nasa/features/presenter/controllers/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/date_mock.dart';
import '../../mocks/space_media_entity_mock.dart';

class MockGetSpaceMediaFromDataUsecase extends Mock
    implements GetSpaceMediaFromDateUsecase {}

void main() {
  late HomeController controller;
  late GetSpaceMediaFromDateUsecase mockUsecase;

  setUp(() {
    mockUsecase = MockGetSpaceMediaFromDataUsecase();
    controller = HomeController(mockUsecase);
  });

  test('should return a SpaceMedia from the usecase', () async {
    when(() => mockUsecase(any()))
        .thenAnswer((_) async => const Right(tSpaceMedia));

    await controller.getSpaceMediaFromDate(tDateTime);

    controller.observer(
      onState: (state) {
        expect(state, tSpaceMedia);
        verify(() => mockUsecase(tDateTime)).called(1);
      },
    );
  });

  final tFailure = ServerFailure();
  test('should return a Failure from the usecase whenthere is an error',
      () async {
    when(() => mockUsecase(any()))
        .thenAnswer((_) async => Left(tFailure));

    await controller.getSpaceMediaFromDate(tDateTime);

    controller.observer(
      onError: (error) {
        expect(error, tFailure);
        verify(() => mockUsecase(tDateTime)).called(1);
      },
    );
  });
}
