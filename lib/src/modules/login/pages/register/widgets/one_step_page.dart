import 'package:curso_list/src/modules/login/pages/register/stores/register_store.dart';
import 'package:curso_list/src/modules/login/pages/register/widgets/step_number_register.dart';

import 'package:curso_list/src/shared/constants/app_images.dart';
import 'package:curso_list/src/shared/constants/app_text_style.dart';
import 'package:curso_list/src/shared/validators/text_validator.dart';
import 'package:curso_list/src/shared/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class OneStepPage extends StatelessWidget {
  final RegisterStore store;
  const OneStepPage({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusNode nameFocusNode = new FocusNode();
    FocusNode emailFocusNode = new FocusNode();

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
                  'Insira seus dados abaixo.',
                  style: AppTextStyle.wine32w700Roboto,
                ),
              ],
            ),
            SizedBox(height: space),
            StepNumberRegister(step: 1),
            SizedBox(height: space),
            Form(
              key: store.formKeyNameAndEmail,
              child: Column(
                children: [
                  Container(
                    height: 45,
                    child: CustomTextField(
                      labelText: 'Nome',
                      validator: (value) =>
                          Validators().validateName(value ?? ''),
                      textInputAction: TextInputAction.next,
                      controller: store.nameController,
                      focusNode: nameFocusNode,
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    height: 45,
                    child: CustomTextField(
                      labelText: 'Email',
                      validator: (value) => Validators().email(value ?? ''),
                      textInputAction: TextInputAction.next,
                      controller: store.emailController,
                      focusNode: emailFocusNode,
                      // errorMessage: store.errorMessage,
                      keyboardType: TextInputType.emailAddress,
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
