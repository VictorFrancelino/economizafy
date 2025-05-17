import 'package:economizafy/widgets/app_input_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EmailInputForm extends StatelessWidget {
  const EmailInputForm({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AppInputForm(
      hintText: "E-mail",
      fieldBuilder:
          (decoration) => FormBuilderTextField(
            name: "email",
            controller: controller,
            decoration: decoration,
            keyboardType: TextInputType.emailAddress,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(),
              FormBuilderValidators.email(),
            ]),
          ),
    );
  }
}
