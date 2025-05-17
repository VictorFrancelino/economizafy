import 'package:economizafy/utils/app_colors.dart';
import 'package:economizafy/widgets/app_card.dart';
import 'package:economizafy/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class StatusDay extends StatelessWidget {
  const StatusDay({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>();

    return AppCard(
      title: "Status do Dia",
      height: 180,
      content: [
        Text(
          "Check-in Pendente",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color:
                Theme.of(context).brightness == Brightness.light
                    ? colors!.black
                    : colors!.white,
          ),
        ),
        LinearPercentIndicator(
          animation: true,
          barRadius: Radius.circular(100),
          backgroundColor: colors.violet.withAlpha(50),
          progressColor: colors.violet,
          percent: 0.5,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(
              color:
                  Theme.of(context).brightness == Brightness.light
                      ? colors.black
                      : colors.white,
              fontSize: 16,
            ),
            children: [
              TextSpan(text: "Faltam "),
              TextSpan(
                text: "R\$5",
                style: TextStyle(
                  color: colors.violet,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(text: " para bater a meta diária"),
            ],
          ),
        ),
        AppTextButton(onPressed: () {}, child: Text("Realizar check-in")),
      ],
    );
  }
}
