// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribe_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SubscribeStore on _SubscribeStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_SubscribeStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

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

  final _$_SubscribeStoreBaseActionController =
      ActionController(name: '_SubscribeStoreBase');

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_SubscribeStoreBaseActionController.startAction(
        name: '_SubscribeStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_SubscribeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory({List<SpecialtyModel>? values, SpecialtyModel? value}) {
    final _$actionInfo = _$_SubscribeStoreBaseActionController.startAction(
        name: '_SubscribeStoreBase.setCategory');
    try {
      return super.setCategory(values: values, value: value);
    } finally {
      _$_SubscribeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
category: ${category}
    ''';
  }
}
