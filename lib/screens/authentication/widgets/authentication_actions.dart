import 'package:economizafy/widgets/app_text_button.dart';
import 'package:flutter/material.dart';

class AuthenticationActions extends StatelessWidget {
  const AuthenticationActions({
    super.key,
    required this.showLoginPage,
    required this.loginUser,
    required this.registerUser,
    required this.isLoading,
    required this.textsOfButtons,
    required this.onToggleAuthMode,
  });

  final bool showLoginPage;
  final bool isLoading;

  final List<String> Function() textsOfButtons;

  final VoidCallback loginUser;
  final VoidCallback registerUser;
  final VoidCallback onToggleAuthMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextButton(
          infinityWidth: true,
          onPressed: () {
            if (isLoading) return;
            FocusScope.of(context).unfocus();
            showLoginPage ? loginUser() : registerUser();
          },
          child:
              isLoading
                  ? CircularProgressIndicator()
                  : Text(textsOfButtons()[0]),
        ),
        AppTextButton(
          onPressed: onToggleAuthMode,
          backgroundColor: false,
          infinityWidth: true,
          child: Text(textsOfButtons()[1]),
        ),
      ],
    );
  }
}
