import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_list/src/shared/constants/app_collections.dart';
import 'package:curso_list/src/shared/models/user_model.dart';

import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseFirestore firebaseFirestore;

  AuthRepositoryImpl(this.firebaseFirestore);

  @override
  Future<UserModel> getUser(String uuid) async {
    CollectionReference db = firebaseFirestore.collection(AppCollections.users);
    final snapshot = await db.where('uuid', isEqualTo: uuid).get();
    final doc = snapshot.size > 0 ? snapshot.docs.first : null;
    return UserModel.fromFirestore(doc);
  }

  void addSpecialtyUser(String uuid, List specialty) async {
    CollectionReference db = firebaseFirestore.collection(AppCollections.users);
    final snapshot = await db.where('uuid', isEqualTo: uuid).get();
    final doc = snapshot.size > 0 ? snapshot.docs.first : null;
    doc!.reference.update({
      'specialty': specialty
    });
  }
}
