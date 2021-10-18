import 'package:curso_list/src/shared/models/cursos_model.dart';

abstract class CoursesRepository {
  Future<List<CoursesModel>> getAllCursos();
}
