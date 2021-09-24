import 'package:curso_list/src/modules/login/pages/login/stores/login_store.dart';
import 'package:curso_list/src/shared/constants/app_colors.dart';
import 'package:curso_list/src/shared/constants/app_images.dart';
import 'package:curso_list/src/shared/constants/app_routes.dart';
import 'package:curso_list/src/shared/validators/text_validator.dart';
import 'package:curso_list/src/shared/widgets/button_gradient_widget.dart';
import 'package:curso_list/src/shared/widgets/button_icon_visible_widget.dart';
import 'package:curso_list/src/shared/widgets/custom_text_field.dart';
import 'package:curso_list/src/shared/widgets/outlined_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  FocusNode emailFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  final _formKey = GlobalKey<FormState>();

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
                child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 45,
                          child: CustomTextField(
                            labelText: 'Email',
                            validator: (value) =>
                                Validators().email(value ?? ''),
                            textInputAction: TextInputAction.next,
                            controller: store.emailController,
                            focusNode: emailFocusNode,
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(height: 25),
                        Container(
                          height: 45,
                          child: Observer(builder: (_) {
                            return CustomTextField(
                              obscureText: store.passwordVisible,
                              labelText: 'Senha',
                              controller: store.passwordController,
                              textInputAction: TextInputAction.done,
                              validator: (value) =>
                                  Validators().validatePass(value ?? ''),
                              focusNode: passwordFocusNode,
                              suffixIcon: ButtonIconVisibleWidget(
                                colorIcon: AppColors.black,
                                showing: store.passwordVisible,
                                onTap: () => store.updatePasswordVisible(
                                    !store.passwordVisible),
                              ),
                            );
                          }),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'Esqueceu a senha ?',
                              style: TextStyle(color: AppColors.wine),
                            ))
                      ],
                    ))),
            SizedBox(height: space),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Container(
                    height: 45,
                    child: GradientButton(
                        text: 'Logar',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            store.login();
                          }
                        }),
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
