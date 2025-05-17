import 'package:economizafy/widgets/app_text_button.dart';
import 'package:flutter/material.dart';

class NewScheduleActions extends StatelessWidget {
  const NewScheduleActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppTextButton(
          onPressed: () {},
          infinityWidth: true,
          child: Text("Criar Cronograma"),
        ),
        AppTextButton(
          onPressed: () {},
          infinityWidth: true,
          backgroundColor: false,
          child: Text("Limpar todos os campos"),
        ),
      ],
    );
  }
}
