import 'package:economizafy/widgets/app_text_button.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
    required this.showLoginPage,
    required this.onForgotPasswordPressed,
  });

  final bool showLoginPage;
  final VoidCallback onForgotPasswordPressed;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showLoginPage,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: AppTextButton(
              onPressed: onForgotPasswordPressed,
              backgroundColor: false,
              addMargin: false,
              child: Text(
                "Esqueci minha senha",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
