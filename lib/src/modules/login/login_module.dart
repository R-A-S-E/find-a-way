import 'package:curso_list/src/modules/login/pages/login/login_page.dart';
import 'package:curso_list/src/modules/login/pages/login/stores/login_store.dart';
import 'package:curso_list/src/modules/login/pages/register/register_page.dart';
import 'package:curso_list/src/modules/login/pages/register/stores/register_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/constants.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => LoginStore()),
        Bind.lazySingleton((i) => RegisterStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => LoginPage()),
        ChildRoute(AppRoutes.register, child: (_, args) => RegisterPage()),
      ];
}
