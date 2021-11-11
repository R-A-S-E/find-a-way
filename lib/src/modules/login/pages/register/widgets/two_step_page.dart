import 'package:curso_list/src/modules/login/pages/register/stores/register_store.dart';
import 'package:curso_list/src/modules/login/pages/register/widgets/step_number_register.dart';

import 'package:curso_list/src/shared/constants/app_images.dart';
import 'package:curso_list/src/shared/constants/app_text_style.dart';
import 'package:curso_list/src/shared/validators/text_validator.dart';
import 'package:curso_list/src/shared/widgets/custom_text_field.dart';
import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';

class TwoStepPage extends StatelessWidget {
  final RegisterStore store;
  const TwoStepPage({Key? key, required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusNode phoneFocusNode = new FocusNode();
    FocusNode cpfFocusNode = new FocusNode();

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
                  style: AppTextStyle.wine20w700Roboto,
                ),
              ],
            ),
            SizedBox(height: space),
            StepNumberRegister(step: 2),
            SizedBox(height: space),
            Form(
              key: store.formKeyPhoneAndCpf,
              child: Column(
                children: [
                  Container(
                    height: 45,
                    child: CustomTextField(
                      labelText: 'Telefone',
                      validator: (value) =>
                          Validators().phoneValidator(value ?? ''),
                      textInputAction: TextInputAction.next,
                      controller: store.phoneController,
                      keyboardType: TextInputType.number,
                      focusNode: phoneFocusNode,
                      inputFormatters: [
                        TextInputMask(
                            mask: ['(99) 9999-9999', '(99) 99999-9999'])
                      ],
                      onEditingComplete: () {
                        FocusScope.of(context).nextFocus();
                      },
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    height: 45,
                    child: CustomTextField(
                      labelText: "CPF",
                      textInputAction: TextInputAction.next,
                      controller: store.cpfController,
                      focusNode: cpfFocusNode,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        TextInputMask(mask: ['999.999.999-99'])
                      ],
                      validator: (cpf) => Validators().cpfValidator(cpf ?? ''),
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
