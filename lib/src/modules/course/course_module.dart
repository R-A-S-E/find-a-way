import 'package:curso_list/src/modules/course/pages/course_page.dart';
import 'package:curso_list/src/modules/course/stores/course_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../shared/constants/constants.dart';

class CourseModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => CourseStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(AppRoutes.initial, child: (_, args) => CoursePage()),
      ];
}
