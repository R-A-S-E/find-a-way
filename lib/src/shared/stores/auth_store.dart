import 'dart:async';
import 'package:curso_list/src/shared/constants/app_routes.dart';
import 'package:curso_list/src/shared/models/user_model.dart';
import 'package:curso_list/src/shared/repositories/auth/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store implements Disposable {
  final FirebaseAuth firebaseAuth;
  final AuthRepository repository;
  

  _AuthStoreBase(this.firebaseAuth, this.repository);

  StreamSubscription<User?>? listen;

  @override
  void dispose() {
    listen?.cancel();
  }

  @observable
  UserModel? user;
  @action
  void setUser(UserModel? value) => user = value;

  @computed
  String get welcomeMessage {
    final String userName = user?.name ?? '';
    return userName.isEmpty ? 'Seja bem-vindo!' : 'Olá, $userName';
  }

  @computed
  List get specialty {
    final List specialty = user!.specialty!;
    return specialty;
  }

  void addSpecialty({required String uuid, required List specialty}) async {
    repository.addSpecialtyUser(uuid, specialty);
  }

  bool verifyAuthentication() {
    return firebaseAuth.currentUser != null;
  }

  Future<UserModel> _getUserData(String uuid) async {
    return await repository.getUser(uuid);
  }

  Future<void> loginUser(String uuid) async {
    final data = await _getUserData(uuid);
    setUser(data);
  }

  Future<void> logoffUser() async {
    await firebaseAuth.signOut();
    Modular.to.pushReplacementNamed(AppRoutes.login);
    setUser(null);
  }
}
