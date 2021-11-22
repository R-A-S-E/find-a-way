import 'package:curso_list/src/modules/subscribe/stores/subscribe_store.dart';
import 'package:curso_list/src/shared/constants/app_gradients.dart';
import 'package:curso_list/src/shared/constants/app_text_style.dart';
import 'package:curso_list/src/shared/models/specialty_model.dart';
import 'package:curso_list/src/shared/validators/text_validator.dart';
import 'package:curso_list/src/shared/widgets/button_gradient_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SubscribePage extends StatefulWidget {
  const SubscribePage({Key? key}) : super(key: key);

  @override
  _SubscribePageState createState() => _SubscribePageState();
}

class _SubscribePageState extends ModularState<SubscribePage, SubscribeStore> {
  final _formKey = GlobalKey<FormState>();
  final controllerCategory = TextEditingController();
  final controllerSubCategory = TextEditingController();
  final controllerSpecialty = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Especialidade'),
        centerTitle: true,
        flexibleSpace: Container(
          height: 200,
          decoration: BoxDecoration(gradient: AppGradients.purpleGradient),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: double.infinity,
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Text('Categoria', style: AppTextStyle.wine20w700Roboto),
                      SizedBox(height: 15),
                      TypeAheadFormField<SpecialtyModel?>(
                        textFieldConfiguration: TextFieldConfiguration(
                            controller: controllerCategory,
                            decoration: InputDecoration(
                              hintText: 'Escolha uma categoria',
                              border: OutlineInputBorder(),
                            )),
                        validator: (value) =>
                          Validators().validateCategory(value ?? ''),
                        suggestionsCallback: store.getCategory,
                        itemBuilder: (context, SpecialtyModel? suggestion) {
                          final user = suggestion!;
                          return ListTile(
                            title: Text(user.category),
                          );
                        },
                        transitionBuilder: (context, suggestionsBox, controller) {
                          return suggestionsBox;
                        },
                        onSuggestionSelected: (SpecialtyModel? suggestion) {
                          controllerCategory.text = suggestion!.category;
                          controllerSubCategory.text = '';
                          controllerSpecialty.text = '';
                          store.setIsEqualtoSubCategory(suggestion.category);
                          store.setIsEqualtoSpecialty(''); 
                        },
                      ),
                      SizedBox(height: 40),
                      Text('Sub-categoria', style: AppTextStyle.wine20w700Roboto),
                      SizedBox(height: 15),
                      TypeAheadFormField<SpecialtyModel?>(
                        textFieldConfiguration: TextFieldConfiguration(
                            controller: controllerSubCategory,
                            decoration: InputDecoration(
                              hintText: 'Escolha uma sub-categoria',
                              border: OutlineInputBorder(),
                            ),
                        ),
                        validator: (value) =>
                          Validators().validateSubCategory(value ?? ''),
                        suggestionsCallback: store.getSubCategory,
                        itemBuilder: (context, SpecialtyModel? suggestion) {
                          final user = suggestion!;
                          return ListTile(
                            title: Text(user.subcategory),
                          );
                        },
                        transitionBuilder:
                            (context, suggestionsBox, controller) {
                          return suggestionsBox;
                        },
                        onSuggestionSelected: (SpecialtyModel? suggestion) {
                          controllerSubCategory.text =
                              suggestion!.subcategory;
                          controllerSpecialty.text = '';
                          store.setIsEqualtoSpecialty(suggestion.subcategory);
                        },
                      ),
                      SizedBox(height: 40),
                      Text('Especialidade', style: AppTextStyle.wine20w700Roboto),
                      SizedBox(height: 15),
                      TypeAheadFormField<SpecialtyModel?>(
                        textFieldConfiguration: TextFieldConfiguration(
                            controller: controllerSpecialty,
                            decoration: InputDecoration(
                              hintText: 'Escolha uma especialidade',
                              border: OutlineInputBorder(),
                            ),
                        ),
                        validator: (value) =>
                          Validators().validateSpecialty(value ?? ''),
                        suggestionsCallback: store.getSpecialty,
                        itemBuilder: (context, SpecialtyModel? suggestion) {
                          final user = suggestion!;
                          return ListTile(
                            title: Text(user.specialty),
                          );
                        },
                        transitionBuilder: (context, suggestionsBox, controller) {
                          return suggestionsBox;
                        },
                        onSuggestionSelected: (SpecialtyModel? suggestion) {
                          controllerSpecialty.text = suggestion!.specialty;
                        },
                      ),                      
                      SizedBox(height: 60),
                      Container(
                        height: 45,
                        child: GradientButton(
                            text: 'Adicionar',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                // store.login();
                              }
                            }),
                      ),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
