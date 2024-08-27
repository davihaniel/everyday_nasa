import 'package:everyday_nasa/core/http_client/http_client.dart';
import 'package:everyday_nasa/core/usecase/erros/exceptions.dart';
import 'package:everyday_nasa/core/utils/converters/date_to_string_converter.dart';
import 'package:everyday_nasa/core/utils/keys/nasa_api_keys.dart';
import 'package:everyday_nasa/features/data/datasources/endpoints/nasa_end_points.dart';
import 'package:everyday_nasa/features/data/datasources/space_media_datasource.dart';
import 'package:everyday_nasa/features/data/models/space_media_model.dart';

class NasaDatasourceImplementation implements ISpaceMediaDatasource {
  final HttpClient client;

  NasaDatasourceImplementation(this.client);

  @override
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date) async {
    final response =
        await client.get(NasaEndPoints.apod(NasaApiKeys.apiKey, date.convert));
    if (response.statusCode == 200) {
      return SpaceMediaModel.fromJson(response.data);
    } else {
      throw ServerException();
    }
  }
}
