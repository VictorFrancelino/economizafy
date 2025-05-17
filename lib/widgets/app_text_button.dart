import 'package:economizafy/utils/app_colors.dart';
import 'package:flutter/material.dart';

// TODO: Adicionar paramêtro de borderRadius e otimizar código

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.dangerButton = false,
    this.backgroundColor = true,
    this.infinityWidth = false,
    this.addMargin = true,
  });

  final VoidCallback onPressed;
  final Widget child;
  final bool dangerButton;
  final bool backgroundColor;
  final bool infinityWidth;
  final bool addMargin;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>();

    return Container(
      width: infinityWidth ? double.infinity : null,
      margin: addMargin ? EdgeInsets.symmetric(horizontal: 20) : null,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor:
              backgroundColor
                  ? WidgetStatePropertyAll(
                    dangerButton ? colors!.red : colors!.violet,
                  )
                  : null,
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        child: DefaultTextStyle.merge(
          style: TextStyle(
            color:
                backgroundColor
                    ? Theme.of(context).brightness == Brightness.light
                        ? colors!.white
                        : colors!.black
                    : dangerButton
                    ? colors!.red
                    : colors!.violet,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
          child: child,
        ),
      ),
    );
  }
}
