import 'package:curso_list/src/shared/constants/app_routes.dart';
import 'package:curso_list/src/shared/constants/app_text_style.dart';
import 'package:curso_list/src/shared/constants/constants.dart';
import 'package:curso_list/src/shared/models/specialty_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'item_card_home_widget.dart';

class BodyHomePageWidget extends StatelessWidget {
  final List<SpecialtyModel> specialty;
  const BodyHomePageWidget({
    Key? key,
    required this.specialty,
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
                        child: Text('${specialty.length}',
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
                if(specialty.isEmpty)
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.search,size: 120,color: AppColors.greyLight,),
                    SizedBox(height: 120),
                    Text('Adicione uma especialidade',style: AppTextStyle.wine20w700Roboto),
                    Icon(Icons.arrow_downward,size: 80,color: AppColors.purple,),
                    SizedBox(height: 40)
                  ],
                );
                else
                return ListView(
                  children: specialty
                      .map((specialty) => ItemCardHomeWidget(
                            onTap: () => Modular.to.pushNamed(AppRoutes.course,
                                arguments: specialty.specialty),
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