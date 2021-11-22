import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_list/src/modules/subscribe/data/repositories/subscribe_repository.dart';
import 'package:curso_list/src/shared/models/specialty_model.dart';


class SubscribeRepositoryImpl implements SubscribeRepository {
  final FirebaseFirestore firebaseFirestore;

  SubscribeRepositoryImpl(this.firebaseFirestore);

  @override
  Future<List<SpecialtyModel>> getallcategory({String? isEqualto,required String where, required String collection}) async {
    CollectionReference db =
        firebaseFirestore.collection(collection);

    final snapshot =
        await db.where(where,isEqualTo: isEqualto).get();

    return snapshot.docs.map((e) => SpecialtyModel.fromFirestore(e)).toList();
  }
}
