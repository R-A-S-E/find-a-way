import 'package:curso_list/src/modules/login/pages/register/widgets/step_number_register.dart';
import 'package:curso_list/src/shared/constants/app_colors.dart';
import 'package:curso_list/src/shared/constants/app_images.dart';
import 'package:curso_list/src/shared/constants/app_text_style.dart';
import 'package:curso_list/src/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class TwoStepPage extends StatelessWidget {
  const TwoStepPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final space = MediaQuery.of(context).size.height * 0.1;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: space),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppImages.logo,
                  height: 150,
                  width: 150,
                ),
                Text(
                  'Bem-vindo!',
                  style: AppTextStyle.purple42w700Roboto,
                ),
                Text(
                  'Mais alguns dados.',
                  style: AppTextStyle.wine32w700Roboto,
                ),
              ],
            ),
            SizedBox(height: space),
            StepNumberRegister(step: 2),
            SizedBox(height: space),
            Column(
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: AppColors.greyLight,
                      borderRadius: BorderRadius.circular(14)),
                  child: CustomTextField(
                    hintText: 'Telefone',
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: AppColors.greyLight,
                      borderRadius: BorderRadius.circular(14)),
                  child: CustomTextField(
                    hintText: 'CPF',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
