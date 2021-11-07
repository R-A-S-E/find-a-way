import 'package:curso_list/src/shared/constants/app_colors.dart';
import 'package:curso_list/src/shared/constants/app_text_style.dart';
import 'package:curso_list/src/shared/models/course_model.dart';
import 'package:curso_list/src/shared/utils/formatters.dart';
import 'package:flutter/material.dart';

class ItemCardCourseWidget extends StatelessWidget {
  final CourseModel course;
  final void Function()? onTap;

  const ItemCardCourseWidget({Key? key, required this.course, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      child: Card(
        elevation: 6,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.wine),
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: ListTile(
            onTap: onTap,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: 140,
                      child: Text(
                        '${course.title}',
                        style: AppTextStyle.black16w700Roboto,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                         decoration: BoxDecoration(
            border: Border.all(color: AppColors.wine),
            borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          'inscrição: ${Formatters.dateParsing(course.subscription?? DateTime.now())}',
                          style: AppTextStyle.black12w700Roboto,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
              height: 30,
              width:140,
              decoration: BoxDecoration(
                 border: Border.all(color: AppColors.wine),
            borderRadius: BorderRadius.all(Radius.circular(4)), 
                    color: AppColors.wine,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.schedule,color: AppColors.white,),
                    Text('${Formatters.formatHours(course.hours)}',
                        overflow: TextOverflow.visible,
                        maxLines: 1,
                        style: AppTextStyle.white14w400Roboto),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2,),
            Container(
              height: 30,
              width: 140,
              decoration: BoxDecoration(               
                borderRadius: BorderRadius.all(Radius.circular(4)),          
                color: AppColors.purple,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.payments,color: AppColors.white,),
                    Text('${Formatters.formatMoney(course.price)}',
                        overflow: TextOverflow.visible,
                        maxLines: 1,
                        style: AppTextStyle.white14w400Roboto),
                  ],
                ),
              ),
            ),
                  ],
                ),
              ],
            ),
        
          ),
        ),
      ),
    );
  }
}
