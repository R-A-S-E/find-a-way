import 'package:curso_list/src/shared/constants/app_colors.dart';
import 'package:curso_list/src/shared/constants/app_text_style.dart';
import 'package:curso_list/src/shared/models/cursos_model.dart';
import 'package:flutter/material.dart';

class ItemCardWidget extends StatelessWidget {
  final CoursesModel specialty;
  final void Function()? onTap;

  const ItemCardWidget({Key? key, required this.specialty, this.onTap})
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
            'Area: ${specialty.category}',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text(
            'Sub-Area: ${specialty.subcategory}',
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
                child: Text(specialty.specialty,
                    overflow: TextOverflow.visible,
                    maxLines: 1,
                    style: AppTextStyle.white14w400Roboto)),
          ),
        ),
      ),
    );
  }
}
