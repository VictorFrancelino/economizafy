import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  AppColors({required this.violet, required this.red, required this.gray});

  final Color violet;
  final Color black = Color(0xFF212529);
  final Color white = Color(0xFFF8F9FA);
  final Color gray;
  final Color red;

  @override
  AppColors copyWith({
    Color? violet,
    Color? black,
    Color? white,
    Color? gray,
    Color? red,
  }) {
    return AppColors(
      violet: violet ?? this.violet,
      red: red ?? this.red,
      gray: gray ?? this.gray,
    );
  }

  @override
  AppColors lerp(covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }

    return AppColors(
      violet: Color.lerp(violet, other.violet, t)!,
      red: Color.lerp(red, other.red, t)!,
      gray: Color.lerp(gray, other.gray, t)!,
    );
  }
}
