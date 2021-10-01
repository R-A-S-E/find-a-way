import 'package:curso_list/src/shared/stores/auth_store.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final AuthStore authStore;

  _HomeStoreBase(this.authStore);

  @observable
  bool isLoading = false;
  @action
  void setIsLoading(bool value) => isLoading = value;

  Future<void> init() async {
    setIsLoading(true);
    await Future.delayed(Duration(seconds: 1));
    setIsLoading(false);
  }
}
