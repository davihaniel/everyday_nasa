import '../models/space_media_model.dart';

abstract class ISpaceMediaDatasource  {
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date);
}