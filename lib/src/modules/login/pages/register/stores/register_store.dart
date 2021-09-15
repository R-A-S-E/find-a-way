import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  final PageController pageController = PageController(initialPage: 0);

  @observable
  int currentPage = 0;

  @action
  void updateCurrentPage(int index) {
    this.currentPage = index;
  }

  void pushPage() {
    pageController.jumpToPage(this.currentPage + 1);
  }

  void popPage() {
    pageController.jumpToPage(this.currentPage - 1);
  }
}
