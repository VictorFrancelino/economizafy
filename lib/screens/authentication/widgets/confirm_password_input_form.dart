import 'package:economizafy/widgets/app_input_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ConfirmPasswordInputForm extends StatelessWidget {
  const ConfirmPasswordInputForm({
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
        hintText: "Confirmar Senha",
        fieldBuilder:
            (decoration) => FormBuilderTextField(
              name: "confirmPassword",
              controller: controller,
              obscureText: true,
              decoration: decoration,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "Confirme sua senha"),
                (value) {
                  final password =
                      FormBuilder.of(context)?.fields["password"]?.value;

                  if (password == null) return "Digite a senha primeiro";
                  if (value != password) return "As senhas não coincidem";

                  return null;
                },
              ]),
            ),
      ),
    );
  }
}
