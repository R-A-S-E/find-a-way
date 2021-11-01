import 'package:curso_list/src/modules/course/repositories/course_repository.dart';
import 'package:curso_list/src/shared/models/course_model.dart';
import 'package:curso_list/src/shared/stores/auth_store.dart';
import 'package:mobx/mobx.dart';
part 'course_store.g.dart';

class CourseStore = _CourseStoreBase with _$CourseStore;

abstract class _CourseStoreBase with Store {

  late final AuthStore authStore;
  final CourseRepository repository;
  

  _CourseStoreBase(
    this.authStore, this.repository
    );

  Future<void> init() async {
    await handleGetTransaction();
  }

  String? specialty;

  @observable
  bool isLoading = false;
  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  ObservableList<CourseModel> courses = ObservableList<CourseModel>();
  @action
  void setCourses({List<CourseModel>? values, CourseModel? value}) {
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
    final course = await repository.getAllCursos(specialty: specialty!);
    setCourses(values: course);
    await Future.delayed(Duration(seconds: 1));
    setIsLoading(false);
  }
}
