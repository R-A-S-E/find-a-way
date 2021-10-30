import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_list/src/modules/home/repositories/specialty_repository.dart';
import 'package:curso_list/src/shared/constants/app_collections.dart';
import 'package:curso_list/src/shared/models/specialty_model.dart';


class SpecialtyRepositoryImpl implements SpecialtyRepository {
  final FirebaseFirestore firebaseFirestore;

  SpecialtyRepositoryImpl(this.firebaseFirestore);

  @override
  Future<List<SpecialtyModel>> getAllCursos({required List specialty}) async {
    CollectionReference db =
        firebaseFirestore.collection(AppCollections.specialty);

    final snapshot =
        await db.where(AppCollections.specialty, whereIn: specialty).get();

    return snapshot.docs.map((e) => SpecialtyModel.fromFirestore(e)).toList();
  }
}
