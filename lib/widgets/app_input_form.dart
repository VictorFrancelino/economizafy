import 'package:economizafy/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppInputForm<T> extends StatelessWidget {
  const AppInputForm({
    super.key,
    required this.hintText,
    this.controller,
    required this.fieldBuilder,
  });

  final String hintText;
  final TextEditingController? controller;
  final Widget Function(InputDecoration) fieldBuilder;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>();

    final baseDecoration = InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      hintText: hintText,
      hintStyle: TextStyle(fontSize: 16),
      filled: false,
      fillColor: Colors.transparent,
      errorStyle: TextStyle(color: colors!.red),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colors.red, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colors.red, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colors.gray, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colors.violet, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: fieldBuilder(baseDecoration),
    );
  }
}
