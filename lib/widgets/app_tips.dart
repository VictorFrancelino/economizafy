import 'package:economizafy/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTips extends StatelessWidget {
  const AppTips({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors!.violet.withAlpha(25),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(CupertinoIcons.sparkles, color: colors.violet),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              description,
              style: TextStyle(fontSize: 14, color: colors.violet),
            ),
          ),
        ],
      ),
    );
  }
}
