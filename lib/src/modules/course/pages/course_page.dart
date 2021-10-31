import 'package:curso_list/src/modules/course/stores/course_store.dart';
import 'package:curso_list/src/modules/course/widgets/body_course_page_widget.dart';
import 'package:curso_list/src/shared/constants/app_gradients.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends ModularState<CoursePage, CourseStore> {

  @override
  void initState() {
    super.initState();
    store.init();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text('Cursos');
        }),
        centerTitle: true,
        flexibleSpace: Container(
          height: 200,
          decoration: BoxDecoration(gradient: AppGradients.purpleGradient),
        ),
      ),
     
      body: Observer(builder: (_) {
        if (store.isLoading == true)
          return Center(
            child: RefreshProgressIndicator(),
          );
        else
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                BodyCoursePageWidget(
                  course: store.courses,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                )
              ],
            ),
          );
      }),

    );
  }
}
