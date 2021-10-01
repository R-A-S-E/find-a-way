import 'package:curso_list/src/modules/home/stores/home_store.dart';
import 'package:curso_list/src/shared/constants/app_gradients.dart';
import 'package:curso_list/src/shared/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class AppBarTransactionWidget extends StatelessWidget with PreferredSizeWidget {
  final Size preferredSize;
  final HomeStore? store;

  final VoidCallback? buttonInput;
  final VoidCallback? buttonOutput;
  final VoidCallback? buttonAll;

  AppBarTransactionWidget({
    Key? key,
    this.buttonInput,
    this.buttonOutput,
    this.buttonAll,
    this.store,
  })  : preferredSize = Size.fromHeight(180.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final double containerHeight = MediaQuery.of(context).size.height * 0.35;

    return Container(
      constraints: BoxConstraints(
        minHeight: 100,
        maxHeight: 150,
      ),
      height: containerHeight,
      decoration: BoxDecoration(gradient: AppGradients.purpleGradient),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SafeArea(
              child: Text(
            'Ola,',
            style: AppTextStyle.wine32w700Roboto,
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 11),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTextButtonWidget("Entradas", buttonInput, 0),
                    Container(
                      height: 20,
                      width: 1,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                    ),
                    _buildTextButtonWidget("Saídas", buttonOutput, 1),
                    Container(
                      height: 20,
                      width: 1,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                    ),
                    _buildTextButtonWidget("Todos", buttonAll, 2),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextButtonWidget(
      String text, VoidCallback? onPressed, int screen) {
    return Observer(
      builder: (_) {
        return Expanded(
          child: TextButton(
            onPressed: () {},
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 16, color: Color.fromARGB(60, 255, 255, 255)),
            ),
          ),
        );
      },
    );
  }
}
