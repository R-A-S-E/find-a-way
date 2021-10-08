import 'package:curso_list/src/shared/models/cursos_model.dart';
import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  final CursosModel cursos;

  const ItemCardWidget({Key? key, required this.cursos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Area: ${cursos.course}'),
      subtitle: Text('Sub-Area: ${cursos.subcategoria}'
          '\nEspecialidade: ${cursos.especialidade}'),
    );
  }
}
