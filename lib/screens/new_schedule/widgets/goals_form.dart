import 'package:economizafy/widgets/app_input_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class GoalsForm extends StatelessWidget {
  const GoalsForm({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppInputForm(
            hintText: "Meta",
            fieldBuilder:
                (decoration) => FormBuilderTextField(
                  name: "meta",
                  controller: controller,
                  decoration: decoration,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: "Campo obrigatório",
                    ),
                    FormBuilderValidators.match(
                      RegExp(r'^[a-zA-ZÀ-ÿ\s]+$'),
                      errorText: "Apenas letras são permitidas",
                    ),
                  ]),
                ),
          ),
        ),
        Expanded(
          child: AppInputForm(
            hintText: "Prazo",
            fieldBuilder:
                (decoration) => FormBuilderDateTimePicker(
                  locale: Locale("pt", "BR"),
                  name: "name",
                  controller: controller,
                  decoration: decoration,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: "Campo obrigatório",
                    ),
                  ]),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2077),
                ),
          ),
        ),
      ],
    );
  }
}
