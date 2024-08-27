import 'package:dartz/dartz.dart';
import 'package:everyday_nasa/features/domain/entities/space_media_entity.dart';

import '../../../core/usecase/erros/failures.dart';
import '../../../core/usecase/usecase.dart';
import '../repositories/space_media_repository.dart';

class GetSpaceMediaFromDateUsecase implements Usecase<SpaceMediaEntity, DateTime> {
  final ISpaceMediaRepository repository;

  GetSpaceMediaFromDateUsecase(this.repository);

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(DateTime? date) async {
    
    return date != null ? await repository.getSpaceMediaFromDate(date) : Left(NullParamFailure());
  }
}
