import 'package:everyday_nasa/features/domain/entities/space_media_entity.dart';
import 'package:everyday_nasa/features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class HomeController extends Store<SpaceMediaEntity> {
  final GetSpaceMediaFromDateUsecase usecase;

  HomeController(this.usecase)
      : super(const SpaceMediaEntity(
            description: 'description',
            mediaType: 'mediaType',
            title: 'title',
            mediaUrl: 'mediaUrl'));

  getSpaceMediaFromDate(DateTime? date) async {
    setLoading(true);
    final result = await usecase(date);
    result.fold(
      (error) => setError(error),
      (sucess) => update(sucess),
    );
    setLoading(false);
  }
}
