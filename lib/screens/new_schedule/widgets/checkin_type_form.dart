import 'package:economizafy/widgets/app_input_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CheckinTypeForm extends StatelessWidget {
  const CheckinTypeForm({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AppInputForm(
      hintText: "Forma de Check-in",
      fieldBuilder:
          (decoration) => FormBuilderDropdown(
            hint: Text("Forma de Check-in"),
            name: "checkinForm",
            decoration: decoration,
            validator: FormBuilderValidators.compose<dynamic>([
              FormBuilderValidators.required(errorText: "Campo obrigatório"),
            ]),
            items: [
              DropdownMenuItem(value: "Diário", child: Text("Diário")),
              DropdownMenuItem(value: "Semanal", child: Text("Semanal")),
              DropdownMenuItem(value: "Mensal", child: Text("Mensal")),
              DropdownMenuItem(value: "Bimestral", child: Text("Bimestral")),
              DropdownMenuItem(value: "Trimestral", child: Text("Trimestral")),
            ],
          ),
    );
  }
}
