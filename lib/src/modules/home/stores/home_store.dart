import 'package:curso_list/src/modules/home/repositories/cursos_repository.dart';
import 'package:curso_list/src/shared/models/cursos_model.dart';
import 'package:curso_list/src/shared/stores/auth_store.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  late final AuthStore authStore;
  final CursosRepository repository;

  _HomeStoreBase(this.authStore, this.repository);

  @override
  Future<void> init() async {
    await handleGetTransaction();
  }

  @observable
  bool isLoading = false;
  @action
  void setIsLoading(bool value) => isLoading = value;

  @observable
  ObservableList<CursosModel> cursos = ObservableList<CursosModel>();
  @action
  void setCursos({List<CursosModel>? values, CursosModel? value}) {
    if (values != null) {
      cursos.clear();
      print('oi');
      cursos.addAll(values);
      print(cursos);
    }

    if (value != null) {
      if (cursos.contains(value)) {
        final idx = cursos.indexOf(value);
        cursos[idx] = value;
      } else {
        cursos.add(value);
      }
    }
  }

  Future<void> handleGetTransaction() async {
    setIsLoading(true);
    final curso = await repository.getAllCursos();
    setCursos(values: curso);
    await Future.delayed(Duration(seconds: 1));
    setIsLoading(false);
  }
}
