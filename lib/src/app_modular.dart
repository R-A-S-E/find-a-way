import 'package:curso_list/src/modules/login/login_module.dart';
import 'package:curso_list/src/modules/splash/splash_module.dart';
import 'package:curso_list/src/shared/constants/app_routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(AppRoutes.splash, module: SplashModule()),
        ModuleRoute(AppRoutes.login, module: LoginModule()),
      ];
}
