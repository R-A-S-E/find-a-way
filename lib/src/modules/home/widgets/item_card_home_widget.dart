import 'package:curso_list/src/shared/constants/app_colors.dart';
import 'package:curso_list/src/shared/constants/app_text_style.dart';
import 'package:curso_list/src/shared/models/specialty_model.dart';
import 'package:flutter/material.dart';

class ItemCardHomeWidget extends StatelessWidget {
  final SpecialtyModel specialty;
  final void Function()? onTap;
  final void Function()? onLongPress;

  const ItemCardHomeWidget({Key? key, required this.specialty, this.onTap, this.onLongPress})
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
            onLongPress: onLongPress,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Area: ${specialty.category}',
                      style: AppTextStyle.black16w700Roboto,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      'Sub: ${specialty.subcategory}',
                      style: AppTextStyle.black12w700Roboto,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),        
                  ],
                ),
                Container(
                  height: 60,
                  width: 80,
                  decoration: BoxDecoration(            
                    borderRadius: BorderRadius.all(Radius.circular(4)),        
                    color: AppColors.wine,
                  ),
                  child: Center(
                      child: Text(specialty.specialty,
                          overflow: TextOverflow.visible,
                          maxLines: 1,
                          style: AppTextStyle.white14w400Roboto)),
                ),
              ],
            ),        
          ),
        ),
      ),
    );
  }
}
