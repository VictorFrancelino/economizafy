import 'package:economizafy/widgets/app_input_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class DescriptionForm extends StatelessWidget {
  const DescriptionForm({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AppInputForm(
      hintText: "Descrição",
      fieldBuilder:
          (decoration) => FormBuilderTextField(
            name: "description",
            controller: controller,
            decoration: decoration,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: "Campo obrigatório"),
              FormBuilderValidators.match(
                RegExp(r'^[a-zA-ZÀ-ÿ\s]+$'),
                errorText: "Apenas letras são permitidas",
              ),
            ]),
          ),
    );
  }
}
