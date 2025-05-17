import 'package:economizafy/screens/authentication/widgets/forgot_password.dart';
import 'package:economizafy/widgets/app_input_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PasswordInputForm extends StatelessWidget {
  const PasswordInputForm({
    super.key,
    required this.controller,
    required this.showLoginPage,
    required this.onForgotPasswordPressed,
  });

  final TextEditingController controller;
  final bool showLoginPage;
  final VoidCallback onForgotPasswordPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppInputForm(
          hintText: "Senha",
          fieldBuilder:
              (decoration) => FormBuilderTextField(
                name: "password",
                controller: controller,
                decoration: decoration,
                obscureText: true,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                    errorText: "Senha obrigatória",
                  ),
                  FormBuilderValidators.minLength(
                    8,
                    errorText: "Mínimo 8 caracteres",
                  ),
                ]),
              ),
        ),
        ForgotPassword(
          showLoginPage: showLoginPage,
          onForgotPasswordPressed: onForgotPasswordPressed,
        ),
      ],
    );
  }
}
