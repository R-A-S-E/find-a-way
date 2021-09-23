import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curso_list/src/modules/login/pages/register/repositories/register_repository_interface.dart';
import 'package:curso_list/src/shared/constants/app_collections.dart';
import 'package:curso_list/src/shared/models/user_model.dart';

class RegisterRepository extends IRegisterRepository {
  final String _collectionPath = AppCollections.users;
  final FirebaseFirestore firestore;

  RegisterRepository(this.firestore);

  @override
  Future<void> createUser(UserModel user) async {
    Map<String, dynamic> firebaseUser = user.toMap();
    firebaseUser['createAt'] = FieldValue.serverTimestamp();
    await FirebaseFirestore.instance
        .collection(_collectionPath)
        .add(firebaseUser);
  }
}
