// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribe_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SubscribeStore on _SubscribeStoreBase, Store {
  final _$categoryAtom = Atom(name: '_SubscribeStoreBase.category');

  @override
  ObservableList<SpecialtyModel> get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(ObservableList<SpecialtyModel> value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$isEqualtoSubCategoryAtom =
      Atom(name: '_SubscribeStoreBase.isEqualtoSubCategory');

  @override
  String get isEqualtoSubCategory {
    _$isEqualtoSubCategoryAtom.reportRead();
    return super.isEqualtoSubCategory;
  }

  @override
  set isEqualtoSubCategory(String value) {
    _$isEqualtoSubCategoryAtom.reportWrite(value, super.isEqualtoSubCategory,
        () {
      super.isEqualtoSubCategory = value;
    });
  }

  final _$subCategoryAtom = Atom(name: '_SubscribeStoreBase.subCategory');

  @override
  ObservableList<SpecialtyModel> get subCategory {
    _$subCategoryAtom.reportRead();
    return super.subCategory;
  }

  @override
  set subCategory(ObservableList<SpecialtyModel> value) {
    _$subCategoryAtom.reportWrite(value, super.subCategory, () {
      super.subCategory = value;
    });
  }

  final _$isEqualtoSpecialtyAtom =
      Atom(name: '_SubscribeStoreBase.isEqualtoSpecialty');

  @override
  String get isEqualtoSpecialty {
    _$isEqualtoSpecialtyAtom.reportRead();
    return super.isEqualtoSpecialty;
  }

  @override
  set isEqualtoSpecialty(String value) {
    _$isEqualtoSpecialtyAtom.reportWrite(value, super.isEqualtoSpecialty, () {
      super.isEqualtoSpecialty = value;
    });
  }

  final _$specialtyAtom = Atom(name: '_SubscribeStoreBase.specialty');

  @override
  ObservableList<SpecialtyModel> get specialty {
    _$specialtyAtom.reportRead();
    return super.specialty;
  }

  @override
  set specialty(ObservableList<SpecialtyModel> value) {
    _$specialtyAtom.reportWrite(value, super.specialty, () {
      super.specialty = value;
    });
  }

  final _$_SubscribeStoreBaseActionController =
      ActionController(name: '_SubscribeStoreBase');

  @override
  void setCategory({List<SpecialtyModel>? values}) {
    final _$actionInfo = _$_SubscribeStoreBaseActionController.startAction(
        name: '_SubscribeStoreBase.setCategory');
    try {
      return super.setCategory(values: values);
    } finally {
      _$_SubscribeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsEqualtoSubCategory(String value) {
    final _$actionInfo = _$_SubscribeStoreBaseActionController.startAction(
        name: '_SubscribeStoreBase.setIsEqualtoSubCategory');
    try {
      return super.setIsEqualtoSubCategory(value);
    } finally {
      _$_SubscribeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSubCategory({List<SpecialtyModel>? values}) {
    final _$actionInfo = _$_SubscribeStoreBaseActionController.startAction(
        name: '_SubscribeStoreBase.setSubCategory');
    try {
      return super.setSubCategory(values: values);
    } finally {
      _$_SubscribeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsEqualtoSpecialty(String value) {
    final _$actionInfo = _$_SubscribeStoreBaseActionController.startAction(
        name: '_SubscribeStoreBase.setIsEqualtoSpecialty');
    try {
      return super.setIsEqualtoSpecialty(value);
    } finally {
      _$_SubscribeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSpecialty({List<SpecialtyModel>? values}) {
    final _$actionInfo = _$_SubscribeStoreBaseActionController.startAction(
        name: '_SubscribeStoreBase.setSpecialty');
    try {
      return super.setSpecialty(values: values);
    } finally {
      _$_SubscribeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
category: ${category},
isEqualtoSubCategory: ${isEqualtoSubCategory},
subCategory: ${subCategory},
isEqualtoSpecialty: ${isEqualtoSpecialty},
specialty: ${specialty}
    ''';
  }
}
