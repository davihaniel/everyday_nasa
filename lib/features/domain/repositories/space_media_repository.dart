import 'package:dartz/dartz.dart';
import 'package:everyday_nasa/core/usecase/erros/failures.dart';
import 'package:everyday_nasa/features/domain/entities/space_media_entity.dart';

abstract class ISpaceMediaRepository{
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(DateTime date);
}
