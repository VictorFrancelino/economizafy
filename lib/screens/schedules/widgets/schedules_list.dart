import 'package:economizafy/utils/app_colors.dart';
import 'package:economizafy/widgets/app_card.dart';
import 'package:flutter/material.dart';
import 'package:sliver_sticky_collapsable_panel/sliver_sticky_collapsable_panel.dart';

class SchedulesList extends StatelessWidget {
  const SchedulesList({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>();
    ScrollController controller = ScrollController();

    return CustomScrollView(
      controller: controller,
      slivers: [
        SliverStickyCollapsablePanel(
          scrollController: controller,
          controller: StickyCollapsablePanelController(key: 'key_1'),
          iOSStyleSticky: true,
          headerBuilder:
              (context, status) => Container(
                width: double.infinity,
                height: 40,
                color: colors!.violet,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Text(
                      "Criados Recentemente",
                      style: TextStyle(
                        color: colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: AnimatedRotation(
                        duration: const Duration(milliseconds: 0),
                        turns: status.isExpanded ? 0 : 0.5,
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          sliverPanel: SliverList.list(
            children: [
              AppCard(addMargin: false, content: [Text("Comprar GTA VI")]),
              AppCard(addMargin: false, content: [Text("Viagem para Paris")]),
              AppCard(addMargin: false, content: [Text("Moto nova")]),
              AppCard(
                addMargin: false,
                content: [Text("Mensalidade da faculdade")],
              ),
            ],
          ),
        ),
        SliverStickyCollapsablePanel(
          scrollController: controller,
          controller: StickyCollapsablePanelController(key: 'key_1'),
          iOSStyleSticky: true,
          headerBuilder:
              (context, status) => Container(
                width: double.infinity,
                height: 40,
                color: colors!.violet,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Text(
                      "Concluídos",
                      style: TextStyle(
                        color: colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: AnimatedRotation(
                        duration: const Duration(milliseconds: 0),
                        turns: status.isExpanded ? 0 : 0.5,
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          sliverPanel: SliverList.list(
            children: [
              AppCard(addMargin: false, content: [Text("Videogame novo")]),
              AppCard(addMargin: false, content: [Text("Dívidas")]),
              AppCard(addMargin: false, content: [Text("Novas peças pro PC")]),
              AppCard(
                addMargin: false,
                content: [Text("Presente de aniversário")],
              ),
              AppCard(addMargin: false, content: [Text("Roupas novas")]),
            ],
          ),
        ),
        SliverStickyCollapsablePanel(
          scrollController: controller,
          controller: StickyCollapsablePanelController(key: 'key_1'),
          iOSStyleSticky: true,
          headerBuilder:
              (context, status) => Container(
                width: double.infinity,
                height: 40,
                color: colors!.violet,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Text(
                      "Excluídos",
                      style: TextStyle(
                        color: colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: AnimatedRotation(
                        duration: const Duration(milliseconds: 0),
                        turns: status.isExpanded ? 0 : 0.5,
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          sliverPanel: SliverList.list(
            children: [
              AppCard(addMargin: false, content: [Text("Carro novo")]),
              AppCard(addMargin: false, content: [Text("Viagem para Londres")]),
              AppCard(
                addMargin: false,
                content: [Text("Mensalidade do curso de inglês")],
              ),
              AppCard(addMargin: false, content: [Text("Celular novo")]),
            ],
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 120)),
      ],
    );
  }
}
