import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_list/src/modules/home/home_module.dart';
import 'package:curso_list/src/modules/login/login_module.dart';
import 'package:curso_list/src/modules/splash/splash_module.dart';
import 'package:curso_list/src/shared/constants/app_routes.dart';
import 'package:curso_list/src/shared/repositories/auth_repository_impl.dart';
import 'package:curso_list/src/shared/stores/auth_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => AuthStore(i(), i())),
        Bind.singleton((i) => AuthRepositoryImpl(i())),
        Bind.singleton((i) => FirebaseAuth.instance),
        Bind.singleton((i) => FirebaseFirestore.instance),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(AppRoutes.splash, module: SplashModule()),
        ModuleRoute(AppRoutes.login, module: LoginModule()),
        ModuleRoute(AppRoutes.home, module: HomeModule()),
      ];
}
