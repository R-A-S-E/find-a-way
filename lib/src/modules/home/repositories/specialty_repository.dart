import 'package:curso_list/src/shared/models/specialty_model.dart';

abstract class SpecialtyRepository {
  Future<List<SpecialtyModel>> getAllCursos({required List specialty});
}
