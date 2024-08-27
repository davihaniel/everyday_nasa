import 'package:dartz/dartz.dart';
import 'package:everyday_nasa/core/usecase/erros/exceptions.dart';
import 'package:everyday_nasa/core/usecase/erros/failures.dart';
import 'package:everyday_nasa/features/domain/entities/space_media_entity.dart';
import 'package:everyday_nasa/features/domain/repositories/space_media_repository.dart';

import '../datasources/space_media_datasource.dart';

class SpaceMediaRepositoryImplementation implements ISpaceMediaRepository {
  final ISpaceMediaDatasource datasource;

  SpaceMediaRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(
      DateTime date) async {
    try {
      final result = await datasource.getSpaceMediaFromDate(date);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
