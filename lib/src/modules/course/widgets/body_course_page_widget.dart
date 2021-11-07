import 'package:curso_list/src/shared/constants/app_text_style.dart';
import 'package:curso_list/src/shared/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'item_card_course_widget.dart';

class BodyCoursePageWidget extends StatelessWidget {
  final List<CourseModel> course;
  const BodyCoursePageWidget({
    Key? key,
    required this.course,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 3,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('${course.first.specialty.toUpperCase()}',style: AppTextStyle.black16w700Roboto,),
                  ),
                  Row(
                    children: [
                      Container(
                        height: double.infinity,
                        width: 1,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                            width: 1,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text('${course.length}',style:AppTextStyle.black16w700Roboto,),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(
              height: 0,
            ),
            Expanded(
              child: ListView(
                children: course
                    .map((course) => ItemCardCourseWidget(
                          onTap: ()async=>await launch('${course.url}'),
                          course: course,
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
