import 'package:curso_list/src/modules/subscribe/repositories/subscribe_repository.dart';
import 'package:curso_list/src/shared/constants/app_collections.dart';
import 'package:curso_list/src/shared/models/specialty_model.dart';
import 'package:curso_list/src/shared/stores/auth_store.dart';
import 'package:mobx/mobx.dart';
part 'subscribe_store.g.dart';

class SubscribeStore = _SubscribeStoreBase with _$SubscribeStore;

abstract class _SubscribeStoreBase with Store {
  late final AuthStore authStore;
  final SubscribeRepository repository;

  _SubscribeStoreBase(this.authStore, this.repository);

  Future<void> init() async {
    await handleGetCategory();
  }

  @observable
  bool isLoading = false;
  @action
  void setIsLoading(bool value) => isLoading = value;

  Future<void> handleGetCategory() async {
    setIsLoading(true);
    final course = await repository.getallcategory(collection: AppCollections.category);
    setCategory(values: course);
    await Future.delayed(Duration(seconds: 1));
    setIsLoading(false);
  }

  @observable
  ObservableList<SpecialtyModel> category = ObservableList<SpecialtyModel>();
  @action
  void setCategory({List<SpecialtyModel>? values, SpecialtyModel? value}) {
    if (values != null) {
      category.clear();
      category.addAll(values);
    }
    if (value != null) {
      if (category.contains(value)) {
        final idx = category.indexOf(value);
        category[idx] = value;
      } else {
        category.add(value);
      }
    }
  }

}
