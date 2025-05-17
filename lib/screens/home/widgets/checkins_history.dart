import 'package:card_swiper/card_swiper.dart';
import 'package:economizafy/utils/app_colors.dart';
import 'package:economizafy/widgets/app_card.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CheckinsHistory extends StatelessWidget {
  const CheckinsHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>();

    final List<BarChartGroupData> barGroups = [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(
            toY: 8,
            gradient: LinearGradient(
              colors: [colors!.violet, colors.violet],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(
            toY: 12,
            gradient: LinearGradient(
              colors: [colors.violet, colors.violet],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(
            toY: 6,
            gradient: LinearGradient(
              colors: [colors.violet, colors.violet],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(
            toY: 14,
            gradient: LinearGradient(
              colors: [colors.violet, colors.violet],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(
            toY: 10,
            gradient: LinearGradient(
              colors: [colors.violet, colors.violet],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ],
      ),
      BarChartGroupData(
        x: 5,
        barRods: [
          BarChartRodData(
            toY: 16,
            gradient: LinearGradient(
              colors: [colors.violet, colors.violet],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ],
      ),
      BarChartGroupData(
        x: 6,
        barRods: [
          BarChartRodData(
            toY: 9,
            gradient: LinearGradient(
              colors: [colors.violet, colors.violet],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ],
      ),
    ];

    final List<String> titles = [
      "31/03",
      "01/04",
      "02/04",
      "03/04",
      "04/04",
      "05/04",
      "Hoje",
    ];

    // TODO: arrumar a exibição da numeração quando o usuário toca em alguma barra dos gráficos
    return AppCard(
      title: "Histórico de Check-ins",
      height: 300,
      showBorder: false,
      addPading: false,
      addMargin: false,

      content: [
        Expanded(
          child: Swiper(
            loop: false,
            index: 4,
            viewportFraction: 0.8,
            scale: 0.8,
            itemCount: 5,
            pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                color: colors.gray,
                activeColor: colors.violet,
                activeSize: 10,
                size: 8,
                space: 6,
              ),
            ),
            outer: true,
            itemBuilder: (context, index) {
              return Container(
                height: 180,
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: colors.gray),
                ),
                child: BarChart(
                  BarChartData(
                    barTouchData: BarTouchData(
                      enabled: true,
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipColor: (group) => colors.violet,
                        tooltipRoundedRadius: 8,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          return BarTooltipItem(
                            rod.toY.toString(),
                            TextStyle(
                              color:
                                  Theme.of(context).brightness ==
                                          Brightness.light
                                      ? colors.white
                                      : colors.black,
                              fontSize: 16,
                            ),
                          );
                        },
                      ),
                    ),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              titles[value.toInt()],
                              style: TextStyle(fontSize: 12),
                            );
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    barGroups: barGroups,
                    gridData: const FlGridData(show: false),
                    alignment: BarChartAlignment.spaceAround,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
