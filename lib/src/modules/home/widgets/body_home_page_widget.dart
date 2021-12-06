import 'package:curso_list/src/modules/home/stores/home_store.dart';
import 'package:curso_list/src/shared/constants/app_routes.dart';
import 'package:curso_list/src/shared/constants/app_text_style.dart';
import 'package:curso_list/src/shared/constants/constants.dart';
import 'package:curso_list/src/shared/widgets/dialog_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'item_card_home_widget.dart';

class BodyHomePageWidget extends StatelessWidget {
  final HomeStore store;
  const BodyHomePageWidget({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Selecione a especialidade:'),
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
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text('${store.courses.length}',
                            style: AppTextStyle.black16w700Roboto),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Divider(height: 1),
            Expanded(
              child: Observer(builder: (_) {
                if (store.courses.isEmpty)
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.search,
                        size: 120,
                        color: AppColors.greyLight,
                      ),
                      SizedBox(height: 120),
                      Text('Adicione uma especialidade',
                          style: AppTextStyle.wine20w700Roboto),
                      Icon(
                        Icons.arrow_downward,
                        size: 80,
                        color: AppColors.purple,
                      ),
                      SizedBox(height: 40)
                    ],
                  );
                else
                  return ListView(
                    children: store.courses
                        .map((specialty) => ItemCardHomeWidget(
                              onTap: () => Modular.to.pushNamed(
                                  AppRoutes.course,
                                  arguments: specialty.specialty),
                              onLongPress: () async => await showDialog(
                                  context: context,
                                  builder: (contextDialog) =>
                                      DialogCustomWidget(onTap: () {
                                        store.removeSpecialty(
                                            specialty.specialty);
                                        Modular.to.pop();
                                      })),
                              specialty: specialty,
                            ))
                        .toList(),
                  );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
