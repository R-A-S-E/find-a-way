import 'package:curso_list/src/shared/models/cursos_model.dart';

abstract class CursosRepository {
  Future<List<CursosModel>> getAllCursos();
}
