import 'package:curso_list/src/modules/login/pages/login/models/login_state.dart';
import 'package:curso_list/src/shared/constants/app_routes.dart';
import 'package:curso_list/src/shared/stores/auth_store.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final AuthStore authStore;
  final FirebaseAuth firebaseAuth;

  _LoginStoreBase(this.authStore, this.firebaseAuth);


  @observable
  LoginState state = LoginState();

  @action
  void setState(LoginState value) => state = value;

  @observable
  bool passwordVisible = true;
  @action
  void updatePasswordVisible(bool value) => this.passwordVisible = value;

  @observable
  bool isLoading = false;
  @action
  void setIsLoading(bool value) => isLoading = value;

  @computed
  bool get disabledButton => (state.email.isEmpty ||
      state.password.isEmpty ||
      state.password.length < 6);

  @computed
  bool get showPasswordField => state.email.isNotEmpty;

  void login() {
    signIn(emailController.text, passwordController.text, () {});
  }

  void signIn(String email, String pass, VoidCallback onFail) async {
    isLoading = true;
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: pass);
      await authStore.loginUser(userCredential.user!.uid);
      Modular.to.pushReplacementNamed(AppRoutes.home);
    } on FirebaseAuthException catch (e) {
      setState(state.copyWith(passwordError: e.message));
    } finally {
      setIsLoading(false);
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
}
