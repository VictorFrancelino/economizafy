import 'package:economizafy/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.icons,
    required this.currentIndex,
    required this.onTap,
  });

  final List<Icon> icons;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>();

    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 60,
        decoration: BoxDecoration(
          color:
              Theme.of(context).brightness == Brightness.light
                  ? colors!.white
                  : colors!.black,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: colors.gray),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(
            icons.length,
            (index) =>
                index == currentIndex
                    ? IconButton.filledTonal(
                      color: colors.violet,
                      style: IconButton.styleFrom(
                        backgroundColor: colors.violet.withAlpha(25),
                      ),
                      onPressed: () => onTap(index),
                      icon: icons[index],
                    )
                    : IconButton(
                      onPressed: () => onTap(index),
                      icon: icons[index],
                      color:
                          Theme.of(context).brightness == Brightness.light
                              ? colors.black
                              : colors.white,
                    ),
          ),
        ),
      ),
    );
  }
}
