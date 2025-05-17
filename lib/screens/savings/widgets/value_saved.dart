import 'package:economizafy/utils/app_colors.dart';
import 'package:economizafy/widgets/app_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ValueSaved extends StatelessWidget {
  const ValueSaved({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>();

    final List<PieChartSectionData> pieChartSections = [
      PieChartSectionData(
        value: 40,
        color: colors!.violet,
        title: '40%',
        radius: 40,
        titleStyle: TextStyle(
          color:
              Theme.of(context).brightness == Brightness.light
                  ? colors.white
                  : colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      PieChartSectionData(
        value: 35,
        color: Colors.green,
        title: '35%',
        radius: 40,
        titleStyle: TextStyle(
          color:
              Theme.of(context).brightness == Brightness.light
                  ? colors.white
                  : colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      PieChartSectionData(
        value: 25,
        color: Colors.amber,
        title: '25%',
        radius: 40,
        titleStyle: TextStyle(
          color:
              Theme.of(context).brightness == Brightness.light
                  ? colors.white
                  : colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];

    return AppCard(
      title: "Valor Economizado",
      height: 200,
      content: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: PieChart(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    PieChartData(
                      sections: pieChartSections,
                      centerSpaceRadius: 40,
                      sectionsSpace: 2,
                      borderData: FlBorderData(show: false),
                      startDegreeOffset: -90,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            text: "Total:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: " R\$1.542,00",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text("Comprar GTA VI: 40%"),
                        Text("Viagem para Paris: 35%"),
                        Text("Moto nova: 25%"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
