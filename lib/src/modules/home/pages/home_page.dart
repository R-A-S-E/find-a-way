import 'package:curso_list/src/modules/home/stores/home_store.dart';
import 'package:curso_list/src/shared/constants/app_gradients.dart';
import 'package:curso_list/src/shared/constants/app_text_style.dart';
import 'package:curso_list/src/shared/widgets/drawer_custom_widget.dart';
import 'package:curso_list/src/shared/widgets/outlined_button_widget.dart';

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
          height: 400,
          decoration: BoxDecoration(gradient: AppGradients.purpleGradient),
        ),
      ),
      drawer: DrawerCustom(
        welcome: store.authStore.welcomeMessage,
        exit: () {},
      ),
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
                Expanded(
                  child: Card(
                    elevation: 3,
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Text('Selecione a categoria:'),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: double.infinity,
                                    width: 1,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black12,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Text('0'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 0,
                        ),
                        Expanded(
                          child: ListView(
                            children: List.generate(20, (index) {
                              return ListTile(
                                title: Text('Curso $index '),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
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
        backgroundColor: Colors.deepPurple.shade900,
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 35,
        ),
      ),
    );
  }
}
