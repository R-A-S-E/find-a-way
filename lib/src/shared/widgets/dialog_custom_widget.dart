import 'package:curso_list/src/shared/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'button_gradient_widget.dart';
import 'outlined_button_widget.dart';

class DialogCustomWidget extends StatelessWidget {

  final void Function()? onTap;
  const DialogCustomWidget({
    Key? key, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,                                   
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Você deseja apagar essa lista ?',
              style: AppTextStyle.wine20w700Roboto,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 20),
                Container(
                  child: GradientButton(
                    text: 'Sim',
                    onTap: onTap,
                  ),
                  height: 40,
                  width: 120,
                ),
                SizedBox(height: 6),
                Container(
                  child: OutlinedButtonCustom(
                    text: 'Não',
                    onTap: ()=> Modular.to.pop(),
                  ),
                  height: 40,
                  width: 120,
                )
              ],
            ),                                      
          ],
        ),
      ),
    );
  }
}