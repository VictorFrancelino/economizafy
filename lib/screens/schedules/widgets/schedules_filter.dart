import 'package:economizafy/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:search_choices/search_choices.dart';

class SchedulesFilter extends StatefulWidget {
  const SchedulesFilter({super.key});

  @override
  State<SchedulesFilter> createState() => _SchedulesFilterState();
}

class _SchedulesFilterState extends State<SchedulesFilter> {
  List<int> selectedItems = [];
  final List<String> labels = [
    "Etiqueta 1",
    "Etiqueta 2",
    "Etiqueta 3",
    "Etiqueta 4",
    "Etiqueta 5",
    "Etiqueta 6",
  ];

  List<DropdownMenuItem<String>> get items =>
      labels
          .map(
            (label) =>
                DropdownMenuItem<String>(value: label, child: Text(label)),
          )
          .toList();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SearchChoices.multiple(
        items: items,
        selectedItems: selectedItems,
        selectedValueWidgetFn: (item) => Chip(label: Text(item!)),
        selectedAggregateWidgetFn:
            (selectedItemsWidgets) => Wrap(
              spacing: 4.0, // Espaço entre os itens
              runSpacing: 4.0, // Espaço entre linhas (se houver quebra)
              children: selectedItemsWidgets,
            ),
        hint: "Sem etiquetas",
        searchHint: Text("Selecione a etiqueta"),
        isExpanded: true,
        dialogBox: false,
        menuConstraints: BoxConstraints.tight(Size.fromHeight(350)),
        onChanged: (value) => setState(() => selectedItems = value),
        closeButton: (selectedItemsClose, closeContext, Function updateParent) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppTextButton(
                onPressed: () {
                  setState(() {
                    selectedItemsClose.clear();
                    selectedItemsClose.addAll(
                      List.generate(items.length, (i) => i),
                    );
                  });
                  updateParent(selectedItemsClose);
                },
                child: Text("Selecionar tudo"),
              ),
              AppTextButton(
                onPressed: () {
                  selectedItemsClose.clear();
                  updateParent(selectedItemsClose);
                },
                child: Text("Limpar"),
              ),
            ],
          );
        },
      ),
    );
  }
}
