import 'package:curso_list/src/modules/login/pages/login/repositories/login_repository_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_repository.dart';

class LoginRepository extends LoginRepositoryInterface {
  final FirebaseAuth _firebaseAuth;

  LoginRepository(this._firebaseAuth);

  @override
  Future<UserCredential> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
