import 'package:curso_list/src/modules/login/pages/register/stores/register_store.dart';
import 'package:curso_list/src/modules/login/pages/register/widgets/step_number_register.dart';
import 'package:curso_list/src/shared/constants/app_colors.dart';
import 'package:curso_list/src/shared/constants/app_images.dart';
import 'package:curso_list/src/shared/constants/app_text_style.dart';
import 'package:curso_list/src/shared/validators/text_validator.dart';
import 'package:curso_list/src/shared/widgets/button_icon_visible_widget.dart';
import 'package:curso_list/src/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ThreeStepPage extends StatelessWidget {
  final RegisterStore store;
  const ThreeStepPage({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusNode passwordFocusNode = new FocusNode();
    FocusNode confirmPasswordFocusNode = new FocusNode();
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
                  'Agora crie sua senha.',
                  style: AppTextStyle.wine32w700Roboto,
                ),
              ],
            ),
            SizedBox(height: space),
            StepNumberRegister(step: 3),
            SizedBox(height: space),
            Form(
              key: store.formKeyPassword,
              child: Column(
                children: [
                  Container(
                    height: 45,
                    child: Observer(
                      builder: (_) => CustomTextField(
                        textInputAction: TextInputAction.next,
                        labelText: "Senha",
                        controller: store.passwordController,
                        focusNode: passwordFocusNode,
                        obscureText: store.passwordVisible,
                        suffixIcon: ButtonIconVisibleWidget(
                          colorIcon: AppColors.black,
                          showing: store.passwordVisible,
                          onTap: () => store
                              .updatePasswordVisible(!store.passwordVisible),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    height: 45,
                    child: Observer(
                      builder: (_) => CustomTextField(
                        labelText: "Confirmar Senha",
                        controller: store.confirmPasswordController,
                        focusNode: confirmPasswordFocusNode,
                        validator: (value) => Validators().validatePassword(
                          value ?? '',
                          store.passwordController.value.text,
                        ),
                        obscureText: store.passwordVisible,
                        suffixIcon: ButtonIconVisibleWidget(
                          colorIcon: AppColors.black,
                          showing: store.passwordVisible,
                          onTap: () => store
                              .updatePasswordVisible(!store.passwordVisible),
                        ),
                      ),
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
