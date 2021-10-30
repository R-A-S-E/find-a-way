import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_list/src/shared/models/specialty_model.dart';
import 'package:curso_list/src/shared/repositories/way/way_repository.dart';

class WayRepositoryImpl implements WayRepository {
  final FirebaseFirestore firebaseFirestore;

  WayRepositoryImpl(this.firebaseFirestore);
  //TODO colocar esse repositorio na pasta do home page

  @override
  Future<List<SpecialtyModel>> getAllCursos({required String collections, List? specialty}) async {
    CollectionReference db =
        firebaseFirestore.collection(collections);

    final snapshot =
        await db.where(collections, whereIn: specialty).get();

    return snapshot.docs.map((e) => SpecialtyModel.fromFirestore(e)).toList();
  }
}
