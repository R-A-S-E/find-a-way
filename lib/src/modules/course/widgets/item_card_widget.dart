import 'package:curso_list/src/shared/constants/app_colors.dart';
import 'package:curso_list/src/shared/constants/app_text_style.dart';
import 'package:curso_list/src/shared/models/course_model.dart';
import 'package:flutter/material.dart';

class ItemCardCourseWidget extends StatelessWidget {
  final CourseModel course;
  final void Function()? onTap;

  const ItemCardCourseWidget({Key? key, required this.course, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.wine),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: ListTile(
          onTap: onTap,
          title: Text(
            'Area: ${course.title}',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text(
            'Sub-Area: ${course.description}',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          trailing: Container(
            height: double.infinity,
            width: 60,
            decoration: BoxDecoration(
              color: AppColors.wine,
            ),
            child: Center(
                child: Text(course.hours.toString(),
                    overflow: TextOverflow.visible,
                    maxLines: 1,
                    style: AppTextStyle.white14w400Roboto)),
          ),
        ),
      ),
    );
  }
}
