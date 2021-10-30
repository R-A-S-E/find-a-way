import 'package:curso_list/src/shared/constants/app_collections.dart';
import 'package:curso_list/src/shared/models/specialty_model.dart';
import 'package:curso_list/src/shared/repositories/way/way_repository.dart';
import 'package:curso_list/src/shared/stores/auth_store.dart';
import 'package:mobx/mobx.dart';
part 'course_store.g.dart';

class CourseStore = _CourseStoreBase with _$CourseStore;

abstract class _CourseStoreBase with Store {

late final AuthStore authStore;
  final WayRepository repository;

  _CourseStoreBase(
    this.authStore, this.repository
    );

  Future<void> init() async {
    await handleGetTransaction();
  }

  @observable
  bool isLoading = false;
  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  ObservableList<SpecialtyModel> courses = ObservableList<SpecialtyModel>();
  @action
  void setCourses({List<SpecialtyModel>? values, SpecialtyModel? value}) {
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
    final course = await repository.getAllCursos(
      collections: AppCollections.courses
    );
    setCourses(values: course);
    await Future.delayed(Duration(seconds: 1));
    setIsLoading(false);
  }
}
