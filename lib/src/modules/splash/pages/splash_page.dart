import 'package:curso_list/src/modules/splash/stores/splash_store.dart';
import 'package:curso_list/src/modules/splash/widgets/logo_splash_widget.dart';
import 'package:curso_list/src/shared/constants/app_gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashStore> {
  late ReactionDisposer _disposer;
  @override
  void initState() {
    _disposer = reaction<String>((_) => store.navigation, (String route) {
      if (route.isNotEmpty) Modular.to.pushReplacementNamed(route);
    });
    store.init();
    super.initState();
  }

  @override
  void dispose() {
    _disposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: AppGradients.purpleGradient,
        ),
        child: Column(
          children: [
            Expanded(
              child: LogoSplashWidget(),
            )
          ],
        ),
      ),
    );
  }
}
