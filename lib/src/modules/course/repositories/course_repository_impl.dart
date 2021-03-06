import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_list/src/modules/course/repositories/course_repository.dart';
import 'package:curso_list/src/shared/constants/app_collections.dart';
import 'package:curso_list/src/shared/models/course_model.dart';



class CourseRepositoryImpl implements CourseRepository {
  final FirebaseFirestore firebaseFirestore;

  CourseRepositoryImpl(this.firebaseFirestore);

  @override
  Future<List<CourseModel>> getAllCursos({required String specialty}) async {
    CollectionReference db =
        firebaseFirestore.collection(AppCollections.courses); 
    final snapshot =
        await db.where(AppCollections.specialty, isEqualTo: specialty).get();

    return snapshot.docs.map((e) => CourseModel.fromFirestore(e)).toList();
  }
}
