import 'package:curso_list/src/shared/models/course_model.dart';

abstract class CourseRepository {
  Future<List<CourseModel>> getAllCursos({required String specialty});
}
