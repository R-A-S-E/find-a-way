import 'package:curso_list/src/modules/subscribe/data/repositories/subscribe_repository.dart';
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

  //#######################CATEGORY####################################
  @observable
  ObservableList<SpecialtyModel> category = ObservableList<SpecialtyModel>();
  @action
  void setCategory({List<SpecialtyModel>? values}) {
    if (values != null) {
      category.clear();
      category.addAll(values);
    }
  }

  Future<List<SpecialtyModel>> getCategory(String query) async {
    final course = await repository.getallcategory(
        collection: AppCollections.category, where: 'category');
    setCategory(values: course);
    try {
      return List.of(category).where((city) {
        final cityLower = city.category.toLowerCase();
        final queryLower = query.toLowerCase();
        return cityLower.contains(queryLower);
      }).toList();
    } catch (e) {
      throw Exception();
    }
  }

  //#######################SUB-CATEGORY####################################
  @observable
  String isEqualtoSubCategory = '';
  @action
  void setIsEqualtoSubCategory(String value) => isEqualtoSubCategory = value;

  @observable
  ObservableList<SpecialtyModel> subCategory = ObservableList<SpecialtyModel>();
  @action
  void setSubCategory({List<SpecialtyModel>? values}) {
    if (values != null) {
      subCategory.clear();
      subCategory.addAll(values);
    }
  }

  Future<List<SpecialtyModel>> getSubCategory(String query) async {
    final coursesubCategory = await repository.getallcategory(
        collection: AppCollections.subcategory,
        where: AppCollections.category,
        isEqualto: isEqualtoSubCategory);
    setSubCategory(values: coursesubCategory);
    try {
      return List.of(subCategory).where((subCategoryImpl) {
        final subCategoryLower = subCategoryImpl.subcategory.toLowerCase();
        final subCategoryQueryLower = query.toLowerCase();
        return subCategoryLower.contains(subCategoryQueryLower);
      }).toList();
    } catch (e) {
      throw Exception();
    }
  }

  //#######################SPECIALTY####################################
  @observable
  String isEqualtoSpecialty = '';
  @action
  void setIsEqualtoSpecialty(String value) => isEqualtoSpecialty = value;

  @observable
  ObservableList<SpecialtyModel> specialty = ObservableList<SpecialtyModel>();
  @action
  void setSpecialty({List<SpecialtyModel>? values}) {
    if (values != null) {
      specialty.clear();
      specialty.addAll(values);
    }
  }

  Future<List<SpecialtyModel>> getSpecialty(String query) async {
    final courseSpecialty = await repository.getallcategory(
        collection: AppCollections.specialty,
        where: AppCollections.subcategory,
        isEqualto: isEqualtoSpecialty);
    setSpecialty(values: courseSpecialty);
    try {
      return List.of(specialty).where((specialtyImpl) {
        final specialtyLower = specialtyImpl.subcategory.toLowerCase();
        final specialtyQueryLower = query.toLowerCase();
        return specialtyLower.contains(specialtyQueryLower);
      }).toList();
    } catch (e) {
      throw Exception();
    }
  }

  void addSpecialty(String speci) {
    List data = authStore.user!.specialty!;
    if (!data.contains(speci)) {
      data.add(speci);
    }
    authStore.addSpecialty(specialty: data, uuid: authStore.user!.uuid!);
  }
}
