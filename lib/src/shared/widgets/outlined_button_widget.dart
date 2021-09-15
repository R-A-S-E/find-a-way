import 'package:curso_list/src/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class OutlinedButtonCustom extends StatelessWidget {
  final String text;
  final IconData? prefixIcon;
  final IconData? sufixIcon;
  final Function()? onTap;
  const OutlinedButtonCustom(
      {Key? key,
      required this.text,
      this.onTap,
      this.prefixIcon,
      this.sufixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(4.0),
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(4.0),
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                prefixIcon,
                color: AppColors.wine,
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.wine,
                ),
              ),
              Icon(
                sufixIcon,
                color: AppColors.wine,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
