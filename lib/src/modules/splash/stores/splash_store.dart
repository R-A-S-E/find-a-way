import 'package:mobx/mobx.dart';
import 'package:curso_list/src/shared/constants/app_routes.dart';

part "splash_store.g.dart";

class SplashStore = _SplashStore with _$SplashStore;

abstract class _SplashStore with Store {
  @observable
  String navigation = '';
  @action
  void setNavigation(String value) => navigation = value;

  Future<void> init() async {
    await Future.delayed(Duration(seconds: 2));
    setNavigation(AppRoutes.login);
  }
}
