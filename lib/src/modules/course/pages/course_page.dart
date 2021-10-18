import 'package:curso_list/src/modules/course/stores/course_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends ModularState<CoursePage, CourseStore> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
