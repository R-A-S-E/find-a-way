import 'package:curso_list/src/modules/home/pages/home_page.dart';
import 'package:curso_list/src/modules/home/repositories/specialty_repository_impl.dart';
import 'package:curso_list/src/modules/home/stores/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/constants.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => HomeStore(i(), i())),
        Bind.singleton((i) => SpecialtyRepositoryImpl(i(),)),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => HomePage()),
      ];
}
