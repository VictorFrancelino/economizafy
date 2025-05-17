import 'package:economizafy/utils/app_colors.dart';
import 'package:flutter/material.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        children: [
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Comprar GTA VI",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 32,
                    color:
                        Theme.of(context).brightness == Brightness.light
                            ? colors!.black
                            : colors!.white,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
            onTap:
                () => showModalBottomSheet(
                  context: context,
                  enableDrag: true,
                  useSafeArea: true,
                  showDragHandle: true,
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.light
                          ? colors.white
                          : colors.black,
                  builder: (context) {
                    return Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Selecione um cronograma",
                            style: TextStyle(
                              color:
                                  Theme.of(context).brightness ==
                                          Brightness.light
                                      ? colors.black
                                      : colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            height: 200,
                            child: ListView(
                              children: [
                                ListTile(
                                  title: Text(
                                    "Viagem para Paris",
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? colors.black
                                              : colors.white,
                                    ),
                                  ),
                                  onTap: () => Navigator.pop(context),
                                ),
                                ListTile(
                                  title: Text(
                                    "Moto nova",
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? colors.black
                                              : colors.white,
                                    ),
                                  ),
                                  onTap: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
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
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(text: "Você está a "),
                TextSpan(
                  text: "5 dias",
                  style: TextStyle(color: colors.violet),
                ),
                TextSpan(text: " seguidos dentro do cronograma!"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
