import 'package:curso_list/src/shared/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> getUser(String uuid);
}
