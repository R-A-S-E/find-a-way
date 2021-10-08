import 'package:curso_list/src/shared/constants/app_gradients.dart';
import 'package:curso_list/src/shared/constants/app_text_style.dart';
import 'package:curso_list/src/shared/stores/auth_store.dart';
import 'package:curso_list/src/shared/widgets/outlined_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerCustom extends StatefulWidget {
  const DrawerCustom({
    Key? key,
  }) : super(key: key);

  @override
  _DrawerCustomState createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
  late final AuthStore _authStore;

  @override
  void initState() {
    _authStore = Modular.get<AuthStore>();
    super.initState();
  }

  Future<void> _logoff() async {
    await _authStore.logoffUser();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(gradient: AppGradients.purpleGradient),
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            child: SafeArea(
                child: Text(
              _authStore.welcomeMessage,
              style: AppTextStyle.white32w700Roboto,
            )),
          ),
          Expanded(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Perfil',
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Cadastro',
                      style: AppTextStyle.black16w700Roboto,
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1.5,
              )
            ],
          )),
          Container(
            height: 50,
            child: OutlinedButtonCustom(
                text: 'Sair', onTap: () async => await _logoff()),
          )
        ],
      ),
    );
  }
}
