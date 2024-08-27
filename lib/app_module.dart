import 'package:everyday_nasa/features/data/datasources/space_media_datasource_implementation.dart';
import 'package:everyday_nasa/features/domain/repositories/space_media_repository.dart';
import 'package:everyday_nasa/features/presenter/controllers/home_controller.dart';
import 'package:everyday_nasa/features/presenter/pages/home_page.dart';
import 'package:everyday_nasa/features/presenter/pages/picture_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:everyday_nasa/features/data/repositories/space_media_repository_implementation.dart';
import 'package:everyday_nasa/features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:http/http.dart' as http;

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<ISpaceMediaRepository>(HomeController.new);
    i.add(GetSpaceMediaFromDateUsecase.new);
    i.add(SpaceMediaRepositoryImplementation.new);
    i.add(NasaDatasourceImplementation.new);
    i.add(http.Client.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (_) => const HomePage());
    r.child(
      '/picture',
      child: (_) => PicturePage.fromArgs(r.args.data),
    );
  }
}
