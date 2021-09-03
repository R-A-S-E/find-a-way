import 'package:curso_list/src/modules/splash/pages/splash_page.dart';
import 'package:curso_list/src/modules/splash/stores/splash_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/constants.dart';

class SplashModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => SplashStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => SplashPage()),
      ];
}
