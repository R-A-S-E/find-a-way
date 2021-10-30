import 'package:curso_list/src/shared/models/specialty_model.dart';

abstract class CourseRepository {
  Future<List<SpecialtyModel>> getAllCursos({required String specialty});
}
