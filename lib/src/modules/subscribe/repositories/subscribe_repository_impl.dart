import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_list/src/modules/subscribe/repositories/subscribe_repository.dart';
import 'package:curso_list/src/shared/models/specialty_model.dart';


class SubscribeRepositoryImpl implements SubscribeRepository {
  final FirebaseFirestore firebaseFirestore;

  SubscribeRepositoryImpl(this.firebaseFirestore);

  @override
  Future<List<SpecialtyModel>> getallcategory({String? category,required String collection}) async {
    CollectionReference db =
        firebaseFirestore.collection(collection);

    final snapshot =
        await db.where(collection,isEqualTo: category).get();

    return snapshot.docs.map((e) => SpecialtyModel.fromFirestore(e)).toList();
  }
}
