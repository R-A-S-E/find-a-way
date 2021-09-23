import 'package:curso_list/src/shared/models/user_model.dart';

abstract class IRegisterRepository {
  Future<void> createUser(UserModel user);
}
