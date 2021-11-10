import 'package:curso_list/src/shared/models/specialty_model.dart';

abstract class SubscribeRepository {
  Future<List<SpecialtyModel>> getallcategory({String? category,required String collection});
}
