import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_list/src/modules/home/repositories/courses_repository.dart';

import 'package:curso_list/src/shared/constants/app_collections.dart';
import 'package:curso_list/src/shared/models/cursos_model.dart';
import 'package:curso_list/src/shared/stores/auth_store.dart';

class CoursesRepositoryImpl implements CoursesRepository {
  final FirebaseFirestore firebaseFirestore;
  final AuthStore authStore;

  CoursesRepositoryImpl(this.firebaseFirestore, this.authStore);

  @override
  Future<List<CoursesModel>> getAllCursos() async {
    CollectionReference db =
        firebaseFirestore.collection(AppCollections.specialty);

    final snapshot =
        await db.where('specialty', whereIn: authStore.specialty).get();

    return snapshot.docs.map((e) => CoursesModel.fromFirestore(e)).toList();
  }
}
