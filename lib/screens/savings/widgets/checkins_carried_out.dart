import 'package:economizafy/utils/app_colors.dart';
import 'package:economizafy/widgets/app_card.dart';
import 'package:economizafy/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_group/expansion_tile_group.dart';
import 'package:pager/pager.dart';

class CheckinsCarriedOut extends StatefulWidget {
  const CheckinsCarriedOut({super.key});

  @override
  State<CheckinsCarriedOut> createState() => _CheckinsCarriedOutState();
}

class _CheckinsCarriedOutState extends State<CheckinsCarriedOut> {
  int _currentPage = 1;
  final int _itemsPerPage = 5;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>();

    final List<Widget> items = [
      ExpansionTileCard(
        title: Text("Cronograma 1"),
        subtitle: Text("Etiqueta", style: TextStyle(fontSize: 12)),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("Valor guardado: R\$50", style: TextStyle(fontSize: 12)),
              AppTextButton(onPressed: () {}, child: Text("Exibir Cronograma")),
            ],
          ),
        ],
      ),
      ExpansionTileCard(
        title: Text("Cronograma 2"),
        subtitle: Text("Etiqueta", style: TextStyle(fontSize: 12)),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("Valor guardado: R\$50", style: TextStyle(fontSize: 12)),
              AppTextButton(onPressed: () {}, child: Text("Exibir Cronograma")),
            ],
          ),
        ],
      ),
      ExpansionTileCard(
        title: Text("Cronograma 3"),
        subtitle: Text("Etiqueta", style: TextStyle(fontSize: 12)),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("Valor guardado: R\$50", style: TextStyle(fontSize: 12)),
              AppTextButton(onPressed: () {}, child: Text("Exibir Cronograma")),
            ],
          ),
        ],
      ),
      ExpansionTileCard(
        title: Text("Cronograma 4"),
        subtitle: Text("Etiqueta", style: TextStyle(fontSize: 12)),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("Valor guardado: R\$50", style: TextStyle(fontSize: 12)),
              AppTextButton(onPressed: () {}, child: Text("Exibir Cronograma")),
            ],
          ),
        ],
      ),
      ExpansionTileCard(
        title: Text("Cronograma 5"),
        subtitle: Text("Etiqueta", style: TextStyle(fontSize: 12)),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("Valor guardado: R\$50", style: TextStyle(fontSize: 12)),
              AppTextButton(onPressed: () {}, child: Text("Exibir cronograma")),
            ],
          ),
        ],
      ),
    ];

    final int totalPages =
        (items.length / _itemsPerPage).ceil().clamp(1, double.infinity).toInt();

    final int startIndex = (_currentPage - 1) * _itemsPerPage;
    final int endIndex = (_currentPage * _itemsPerPage).clamp(0, items.length);

    final List<Widget> pageItems = items.sublist(startIndex, endIndex);

    return AppCard(
      title: "Check-ins realizados",
      addPading: false,
      content: [
        ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: pageItems.length,
          itemBuilder: (context, index) => pageItems[index],
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: Pager(
            numberButtonSelectedColor: colors!.violet,
            numberTextUnselectedColor: colors.white,
            currentPage: _currentPage,
            totalPages: totalPages,
            onPageChanged: (page) {
              setState(() {
                _currentPage = page;
              });
            },
            showItemsPerPage: false,
          ),
        ),
      ],
    );
  }
}
