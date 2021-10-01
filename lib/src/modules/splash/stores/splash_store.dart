import 'package:curso_list/src/shared/stores/auth_store.dart';
import 'package:mobx/mobx.dart';
import 'package:curso_list/src/shared/constants/app_routes.dart';

part "splash_store.g.dart";

class SplashStore = _SplashStore with _$SplashStore;

abstract class _SplashStore with Store {
  final AuthStore authStore;
  _SplashStore(this.authStore);

  @observable
  String navigation = '';
  @action
  void setNavigation(String value) => navigation = value;

  Future<void> init() async {
    await Future.delayed(Duration(seconds: 2));
    await handleAuthentication();
  }

  Future<void> handleAuthentication() async {
    final isAuthenticated = authStore.verifyAuthentication();
    (isAuthenticated)
        ? await handleAuthenticatedUser()
        : handleUnauthenticatedUser();
  }

  Future<void> handleUserData() async {
    await authStore.loginUser(authStore.firebaseAuth.currentUser!.uid);
  }

  Future<void> handleAuthenticatedUser() async {
    try {
      await handleUserData();
      setNavigation(AppRoutes.home);
    } catch (e) {
      setNavigation(AppRoutes.login);
    }
  }

  void handleUnauthenticatedUser() {
    setNavigation(AppRoutes.login);
  }
}
