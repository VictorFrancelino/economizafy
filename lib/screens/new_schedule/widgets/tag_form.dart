import 'package:economizafy/widgets/app_input_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class TagForm extends StatelessWidget {
  const TagForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AppInputForm(
      hintText: "Etiqueta",
      fieldBuilder:
          (decoration) => FormBuilderFilterChips<String>(
            name: "etiqueta",
            decoration: decoration,
            validator: FormBuilderValidators.compose<List<String>>([
              FormBuilderValidators.required(errorText: "Campo obrigatório"),
              FormBuilderValidators.minLength(
                1,
                errorText: "Selecione ao menos um valor",
              ),
            ]),
            options: [
              FormBuilderChipOption(value: "Mercado"),
              FormBuilderChipOption(value: "Viagem"),
              FormBuilderChipOption(value: "Videogame"),
            ],
          ),
    );
  }
}
