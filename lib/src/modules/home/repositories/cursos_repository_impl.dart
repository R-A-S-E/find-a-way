import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_list/src/modules/home/repositories/cursos_repository.dart';
import 'package:curso_list/src/shared/constants/app_collections.dart';
import 'package:curso_list/src/shared/models/cursos_model.dart';
import 'package:curso_list/src/shared/stores/auth_store.dart';

class CursosRepositoryImpl implements CursosRepository {
  final FirebaseFirestore firebaseFirestore;
  final AuthStore authStore;

  CursosRepositoryImpl(this.firebaseFirestore, this.authStore);

  @override
  Future<List<CursosModel>> getAllCursos() async {
    CollectionReference db =
        firebaseFirestore.collection(AppCollections.especialidades);

    final snapshot = await db
        // .where('especialidade', arrayContainsAny: authStore.especialidades)
        .get();

    return snapshot.docs.map((e) => CursosModel.fromFirestore(e)).toList();
  }
}
