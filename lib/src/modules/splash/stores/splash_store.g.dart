// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SplashStore on _SplashStore, Store {
  final _$navigationAtom = Atom(name: '_SplashStore.navigation');

  @override
  String get navigation {
    _$navigationAtom.reportRead();
    return super.navigation;
  }

  @override
  set navigation(String value) {
    _$navigationAtom.reportWrite(value, super.navigation, () {
      super.navigation = value;
    });
  }

  final _$_SplashStoreActionController = ActionController(name: '_SplashStore');

  @override
  void setNavigation(String value) {
    final _$actionInfo = _$_SplashStoreActionController.startAction(
        name: '_SplashStore.setNavigation');
    try {
      return super.setNavigation(value);
    } finally {
      _$_SplashStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
navigation: ${navigation}
    ''';
  }
}
