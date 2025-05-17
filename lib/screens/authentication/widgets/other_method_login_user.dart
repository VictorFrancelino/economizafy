import 'package:economizafy/utils/app_colors.dart';
import 'package:economizafy/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:text_divider/text_divider.dart';
import 'package:economizafy/services/authentication_service.dart';

class OtherMethodLoginUser extends StatelessWidget {
  const OtherMethodLoginUser({super.key, required this.showLoginPage});

  final bool showLoginPage;

  Future<void> _handleGoogleSignIn(BuildContext context) async {
    try {
      await AuthenticationService().signInWithGoogle();
    } catch (e) {
      if (context.mounted) {
        showAwesomeSnackbar(
          context: context,
          title: "Erro",
          message: e.toString(),
          isError: true,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>();

    return Visibility(
      visible: showLoginPage,
      child: Column(
        children: [
          TextDivider.horizontal(
            text: const Text("Ou"),
            color:
                Theme.of(context).brightness == Brightness.light
                    ? colors!.black
                    : colors!.white,
          ),
          SizedBox(height: 25),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => _handleGoogleSignIn(context),
                  padding: EdgeInsets.all(10),
                  icon: Iconify(Bi.google, color: colors.violet),
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(color: colors.violet, width: 2),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
