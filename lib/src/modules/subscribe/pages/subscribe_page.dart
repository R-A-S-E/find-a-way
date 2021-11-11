import 'package:curso_list/src/modules/subscribe/stores/subscribe_store.dart';
import 'package:curso_list/src/shared/constants/app_gradients.dart';
import 'package:curso_list/src/shared/constants/app_text_style.dart';
import 'package:curso_list/src/shared/models/specialty_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SubscribePage extends StatefulWidget {
  const SubscribePage({ Key? key }) : super(key: key);

  @override
  _SubscribePageState createState() => _SubscribePageState();
}

class _SubscribePageState extends ModularState<SubscribePage, SubscribeStore> {

    static String _displayStringForOption(SpecialtyModel collection) => collection.category;

   @override
  void initState() {
    super.initState();
    store.init();
  }

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
        child: Card(
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            SizedBox(height: 20),
            Text('Categoria',style: AppTextStyle.black16w700Roboto),
             Autocomplete<SpecialtyModel>(
                  displayStringForOption: _displayStringForOption,
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<SpecialtyModel>.empty();
                    }
                    return store.category.where((SpecialtyModel collection) {
                      return collection.category
                          .contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: null,
                ),
              SizedBox(height: 20),
              Text('Sub-categoria',style: AppTextStyle.black16w700Roboto),
              Autocomplete<SpecialtyModel>(
                  displayStringForOption: _displayStringForOption,
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<SpecialtyModel>.empty();
                    }
                    return store.category.where((SpecialtyModel collection) {
                      return collection.category
                          .contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: null,
                ),
              SizedBox(height: 20),
              Text('Especialidade',style: AppTextStyle.black16w700Roboto),
              Autocomplete<SpecialtyModel>(
                  displayStringForOption: _displayStringForOption,
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<SpecialtyModel>.empty();
                    }
                    return store.category.where((SpecialtyModel collection) {
                      return collection.category
                          .contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: null,
                ),
            ],
          ),
        ),
      ),
      
    );
  }
}