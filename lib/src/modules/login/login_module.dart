import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_list/src/modules/login/pages/login/login_page.dart';
import 'package:curso_list/src/modules/login/pages/login/repositories/login_repository.dart';
import 'package:curso_list/src/modules/login/pages/login/stores/login_store.dart';
import 'package:curso_list/src/modules/login/pages/register/register_page.dart';
import 'package:curso_list/src/modules/login/pages/register/repositories/register_repository.dart';
import 'package:curso_list/src/modules/login/pages/register/stores/register_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/constants.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => LoginStore(i(),i())),
        Bind.lazySingleton((i) => FirebaseFirestore.instance),
        Bind.lazySingleton((i) => RegisterRepository(i())),
        Bind.lazySingleton((i) => RegisterStore(i(),i())),
        Bind.lazySingleton((i) => LoginRepository(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => LoginPage()),
        ChildRoute(AppRoutes.register, child: (_, args) => RegisterPage()),
      ];
}
