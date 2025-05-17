import 'package:economizafy/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    this.title,
    this.showBorder = true,
    this.height,
    this.addPading = true,
    this.addMargin = true,
    required this.content,
    this.onTap,
  });

  final String? title;
  final bool showBorder;
  final double? height;
  final bool? addPading;
  final bool? addMargin;
  final List<Widget> content;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>();

    return Column(
      children: [
        if (title != null) ...[
          Container(
            margin: const EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            child: Text(
              "$title",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color:
                    Theme.of(context).brightness == Brightness.light
                        ? colors!.black.withAlpha(100)
                        : colors!.white.withAlpha(100),
              ),
            ),
          ),
          SizedBox(height: 10),
        ] else
          SizedBox.shrink(),
        Container(
          margin: addMargin! ? EdgeInsets.symmetric(horizontal: 20) : null,
          padding:
              addPading!
                  ? const EdgeInsets.symmetric(horizontal: 20, vertical: 10)
                  : null,
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            border:
                showBorder ? Border.all(width: 2, color: colors!.gray) : null,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: content,
          ),
        ),
      ],
    );
  }
}
