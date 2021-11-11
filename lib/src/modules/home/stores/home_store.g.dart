// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_HomeStoreBase.isLoading');

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

  final _$coursesAtom = Atom(name: '_HomeStoreBase.courses');

  @override
  ObservableList<SpecialtyModel> get courses {
    _$coursesAtom.reportRead();
    return super.courses;
  }

  @override
  set courses(ObservableList<SpecialtyModel> value) {
    _$coursesAtom.reportWrite(value, super.courses, () {
      super.courses = value;
    });
  }

  final _$setCoursesAsyncAction = AsyncAction('_HomeStoreBase.setCourses');

  @override
  Future<void> setCourses(
      {List<SpecialtyModel>? values, SpecialtyModel? value}) {
    return _$setCoursesAsyncAction
        .run(() => super.setCourses(values: values, value: value));
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
courses: ${courses}
    ''';
  }
}
