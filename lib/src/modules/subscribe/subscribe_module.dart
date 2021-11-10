import 'package:curso_list/src/modules/subscribe/pages/subscribe_page.dart';
import 'package:curso_list/src/modules/subscribe/repositories/subscribe_repository_impl.dart';
import 'package:curso_list/src/modules/subscribe/stores/subscribe_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../shared/constants/constants.dart';


class SubscribeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => SubscribeStore(i(),i())),
        Bind.singleton((i) => SubscribeRepositoryImpl(i(),)),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => SubscribePage()),
      ];
}
