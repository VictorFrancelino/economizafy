import 'package:economizafy/widgets/app_text_button.dart';
import 'package:flutter/material.dart';

class HomeActions extends StatelessWidget {
  const HomeActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        spacing: 10,
        children: [
          Expanded(
            child: AppTextButton(
              onPressed: () {},
              addMargin: false,
              child: Text("Editar Cronograma"),
            ),
          ),
          Expanded(
            child: AppTextButton(
              onPressed: () {},
              addMargin: false,
              dangerButton: true,
              child: Text("Emergência"),
            ),
          ),
        ],
      ),
    );
  }
}
