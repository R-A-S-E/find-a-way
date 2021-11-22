import 'package:curso_list/src/modules/home/stores/home_store.dart';
import 'package:curso_list/src/modules/home/widgets/body_home_page_widget.dart';
import 'package:curso_list/src/shared/constants/app_colors.dart';
import 'package:curso_list/src/shared/constants/app_gradients.dart';
import 'package:curso_list/src/shared/constants/app_routes.dart';
import 'package:curso_list/src/shared/widgets/drawer_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    super.initState();
    store.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text(store.authStore.welcomeMessage);
        }),
        centerTitle: true,
        flexibleSpace: Container(
          height: 200,
          decoration: BoxDecoration(gradient: AppGradients.purpleGradient),
        ),
      ),
      drawer: DrawerCustom(),
      body: Observer(builder: (_) {
        if (store.isLoading == true)
          return Center(
            child: RefreshProgressIndicator(),
          );
        else
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                BodyHomePageWidget(
                  specialty: store.courses,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                )
              ],
            ),
          );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.wine,
        onPressed: () async {
          await Modular.to.pushNamed(AppRoutes.subscribe);
          store.handleGetTransaction();
        },
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
