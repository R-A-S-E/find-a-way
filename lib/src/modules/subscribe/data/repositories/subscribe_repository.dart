import 'package:curso_list/src/shared/models/specialty_model.dart';

abstract class SubscribeRepository {
  Future<List<SpecialtyModel>> getallcategory({String? isEqualto,required String where, required String collection});
}
