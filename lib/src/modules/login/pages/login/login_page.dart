import 'package:curso_list/src/shared/constants/app_colors.dart';
import 'package:curso_list/src/shared/constants/app_images.dart';
import 'package:curso_list/src/shared/constants/app_routes.dart';
import 'package:curso_list/src/shared/widgets/button_gradient_widget.dart';
import 'package:curso_list/src/shared/widgets/custom_text_field.dart';
import 'package:curso_list/src/shared/widgets/outlined_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final space = MediaQuery.of(context).size.height * 0.1;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: space),
            Center(
              child: Image.asset(
                AppImages.logo,
                height: 150,
                width: 150,
              ),
            ),
            SizedBox(height: space),
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
                      obscureText: true,
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
            SizedBox(height: space),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Container(
                    height: 45,
                    child: GradientButton(
                      text: 'Logar',
                      onTap: () {},
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 45,
                    child: OutlinedButtonCustom(
                      text: 'Criar Conta',
                      onTap: () => Modular.to.pushNamed(AppRoutes.register),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
