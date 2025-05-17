import 'package:economizafy/widgets/app_input_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class NameInputForm extends StatelessWidget {
  const NameInputForm({
    super.key,
    required this.showLoginPage,
    required this.controller,
  });

  final bool showLoginPage;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !showLoginPage,
      child: AppInputForm(
        hintText: "Nome",
        fieldBuilder:
            (decoration) => FormBuilderTextField(
              name: "name",
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
      ),
    );
  }
}
