import 'package:curso_list/src/shared/constants/app_colors.dart';
import 'package:curso_list/src/shared/constants/app_images.dart';
import 'package:curso_list/src/shared/widgets/button_gradient_widget.dart';
import 'package:curso_list/src/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Image.asset(
              AppImages.logo,
              height: 150,
              width: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: AppColors.greyLight,
                      borderRadius: BorderRadius.circular(14)),
                  child: CustomTextField(
                    hintText: 'Email',
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: AppColors.greyLight,
                      borderRadius: BorderRadius.circular(14)),
                  child: CustomTextField(
                    hintText: 'Senha',
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Esqueceu a senha ?',
                      style: TextStyle(color: AppColors.wine),
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                GradientButton(
                  text: 'Logar',
                  onTap: () {},
                ),
                SizedBox(height: 20),
                Container(
                  height: 45,
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text('Criar Conta'),
                    style: OutlinedButton.styleFrom(
                      primary: AppColors.wine,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
