import 'package:economizafy/utils/app_colors.dart';
import 'package:economizafy/widgets/app_card.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ScheduleGoal extends StatelessWidget {
  const ScheduleGoal({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>();

    return AppCard(
      title: "Meta do Cronograma",
      height: 150,
      content: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularPercentIndicator(
                animation: true,
                radius: 50.0,
                lineWidth: 10.0,
                percent: 0.25,
                center: Text(
                  "25%",
                  style: TextStyle(
                    color: colors!.violet,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                progressColor: colors.violet,
                arcBackgroundColor: colors.violet.withAlpha(50),
                arcType: ArcType.FULL,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color:
                            Theme.of(context).brightness == Brightness.light
                                ? colors.black
                                : colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: "Meta:",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text: " R\$500 em 1 mês"),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color:
                            Theme.of(context).brightness == Brightness.light
                                ? colors.black
                                : colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: "Total economizado:",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text: " R\$25"),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color:
                            Theme.of(context).brightness == Brightness.light
                                ? colors.black
                                : colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: "Valor de check-in:",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        TextSpan(text: " R\$5"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
