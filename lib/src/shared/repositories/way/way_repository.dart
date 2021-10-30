import 'package:curso_list/src/shared/models/specialty_model.dart';

abstract class WayRepository {
  Future<List<SpecialtyModel>> getAllCursos({required String collections, List? specialty});
}
