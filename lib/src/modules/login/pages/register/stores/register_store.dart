import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  final PageController pageController = PageController(initialPage: 0);

  @observable
  int currentPage = 0;

  @action
  void updateCurrentPage(int index) => this.currentPage = index;

  @observable
  bool passwordVisible = true;
  @action
  void updatePasswordVisible(bool value) => this.passwordVisible = value;

  void pushPage() {
    pageController.jumpToPage(this.currentPage + 1);
  }

  void nextPage() {
    if (currentPage == 0) {
      if (formKeyNameAndEmail.currentState!.validate()) {
        pushPage();
      }
    } else if (currentPage == 1) {
      if (formKeyPhoneAndCpf.currentState!.validate()) {
        pushPage();
      }
    } else if (currentPage == 2) {
      if (formKeyPassword.currentState!.validate()) {
        pushPage();
      }
    } else if (currentPage == 3) {
      if (formKeyPassword.currentState!.validate()) {
        pushPage();
      }
    }
  }

  void popPage() {
    pageController.jumpToPage(this.currentPage - 1);
  }

  final formKeyNameAndEmail = GlobalKey<FormState>();
  final formKeyPhoneAndCpf = GlobalKey<FormState>();
  final formKeyPassword = GlobalKey<FormState>();
  final formKeyCourses = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController courseController = TextEditingController();
}
