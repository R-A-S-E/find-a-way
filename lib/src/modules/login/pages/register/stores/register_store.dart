import 'package:curso_list/src/modules/login/pages/register/repositories/register_repository.dart';
import 'package:curso_list/src/shared/constants/app_routes.dart';
import 'package:curso_list/src/shared/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {
  final RegisterRepository repository;
  final FirebaseAuth firebaseAuth;
  final PageController pageController = PageController(initialPage: 0);
  _RegisterStoreBase(this.repository, this.firebaseAuth);

  @observable
  int currentPage = 0;
  @action
  void updateCurrentPage(int index) => this.currentPage = index;

  @observable
  bool passwordVisible = true;
  @action
  void updatePasswordVisible(bool value) => this.passwordVisible = value;

  @observable
  bool isLoading = false;
  @action
  void setIsLoading(bool value) => isLoading = value;

  List cursos = [];
  List subcategoria = [];
  List especialidade = [];

  void pushPage() {
    pageController.jumpToPage(this.currentPage + 1);
  }

  void popPage() {
    pageController.jumpToPage(this.currentPage - 1);
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
      if (formKeyCourses.currentState!.validate()) {
        cursos.add(courseController.text);
        signUp(
            UserModel(
                cpf: cpfController.text,
                name: nameController.text,
                phone: phoneController.text,
                specialty: especialidade),
            () {},
            () {});
      }
    }
  }

  void signUp(
      UserModel userModel, VoidCallback onSuccess, VoidCallback onFail) async {
        
    isLoading = true;
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      userModel = userModel.copyWith(uuid: userCredential.user!.uid);
      await _createUser(userModel);
    } on FirebaseAuthException catch (e) {
      print(e);
    } finally {
      setIsLoading(false);
    }
  }

  Future<void> _createUser(UserModel userModel) async {
    try {
      await repository.createUser(userModel);
      Modular.to.pushReplacementNamed(AppRoutes.login);
      this.isLoading = false;
    } catch (e) {
      this.isLoading = false;
      print(e);
    }
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
