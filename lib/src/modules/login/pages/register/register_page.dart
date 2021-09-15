import 'package:curso_list/src/modules/login/pages/register/stores/register_store.dart';
import 'package:curso_list/src/modules/login/pages/register/widgets/four_step_page.dart';
import 'package:curso_list/src/modules/login/pages/register/widgets/one_step_page.dart';
import 'package:curso_list/src/modules/login/pages/register/widgets/thee_step_page.dart';
import 'package:curso_list/src/modules/login/pages/register/widgets/two_step_page.dart';
import 'package:curso_list/src/shared/widgets/button_gradient_widget.dart';
import 'package:curso_list/src/shared/widgets/outlined_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends ModularState<RegisterPage, RegisterStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: 35,
                width: 120,
                child: OutlinedButtonCustom(
                  text: 'Voltar',
                  prefixIcon: Icons.chevron_left,
                  onTap: () => store.currentPage == 0
                      ? Modular.to.pop()
                      : store.popPage(),
                )),
            Container(
              width: 120,
              height: 35,
              child: GradientButton(
                text: 'Continuar',
                sufixIcon: Icons.chevron_right,
                onTap: () => store.pushPage(),
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: store.pageController,
        onPageChanged: store.updateCurrentPage,
        physics: NeverScrollableScrollPhysics(),
        children: [
          OneStepPage(),
          TwoStepPage(),
          ThreeStepPage(),
          FourStepPage()
        ],
      ),
    );
  }
}
