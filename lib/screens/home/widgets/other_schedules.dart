import 'package:card_swiper/card_swiper.dart';
import 'package:economizafy/utils/app_colors.dart';
import 'package:economizafy/widgets/app_card.dart';
import 'package:economizafy/widgets/app_text_button.dart';
import 'package:flutter/material.dart';

class OtherSchedules extends StatelessWidget {
  const OtherSchedules({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>();
    final List items = [1, 2, 3, 4, 5];

    return AppCard(
      title: "Outros Cronogramas",
      height: 300,
      showBorder: false,
      addMargin: false,
      addPading: false,
      content: [
        Expanded(
          child: Swiper(
            outer: true,
            itemCount: items.length,
            viewportFraction: 0.8,
            scale: 0.8,
            pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                color: colors!.gray,
                activeColor: colors.violet,
                activeSize: 10,
                size: 8,
                space: 6,
              ),
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: colors.gray),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Cronograma $index"),
                    Text("Meta: R\$50"),
                    Text("Progresso: 25%"),
                    AppTextButton(
                      onPressed: () {},
                      child: Text("Exibir cronograma"),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
