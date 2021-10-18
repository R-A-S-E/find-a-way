import 'package:curso_list/src/modules/home/repositories/courses_repository.dart';
import 'package:curso_list/src/shared/models/cursos_model.dart';
import 'package:curso_list/src/shared/stores/auth_store.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  late final AuthStore authStore;
  final CoursesRepository repository;

  _HomeStoreBase(this.authStore, this.repository);

  Future<void> init() async {
    await handleGetTransaction();
  }

  @observable
  bool isLoading = false;
  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  ObservableList<CoursesModel> courses = ObservableList<CoursesModel>();
  @action
  void setCourses({List<CoursesModel>? values, CoursesModel? value}) {
    if (values != null) {
      courses.clear();
      courses.addAll(values);
    }

    if (value != null) {
      if (courses.contains(value)) {
        final idx = courses.indexOf(value);
        courses[idx] = value;
      } else {
        courses.add(value);
      }
    }
  }

  Future<void> handleGetTransaction() async {
    setIsLoading(true);
    final course = await repository.getAllCursos();
    setCourses(values: course);
    await Future.delayed(Duration(seconds: 1));
    setIsLoading(false);
  }
}
