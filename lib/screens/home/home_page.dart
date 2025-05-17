import 'package:economizafy/screens/home/widgets/checkins_history.dart';
import 'package:economizafy/screens/home/widgets/home_actions.dart';
import 'package:economizafy/screens/home/widgets/home_title.dart';
import 'package:economizafy/screens/home/widgets/other_schedules.dart';
import 'package:economizafy/screens/home/widgets/schedule_goal.dart';
import 'package:economizafy/screens/home/widgets/status_day.dart';
import 'package:economizafy/widgets/app_text_button.dart';
import 'package:economizafy/widgets/app_tips.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Widget> contentPage = [
      HomeTitle(),
      AppTips(
        description:
            "Cancele uma assinatura de um serviço não usado para conseguir atingir suas metas mais rápido!",
      ),
      StatusDay(),
      ScheduleGoal(),
      CheckinsHistory(),
      HomeActions(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Início"),
        centerTitle: true,
        leading: IconButton(
          onPressed: Scaffold.of(context).openDrawer,
          icon: Icon(Icons.menu_rounded),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      "O que é essa página?",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    content: Text(
                      "Essa página serve para exibir os dados do cronograma escolhido",
                      style: TextStyle(fontSize: 16),
                    ),
                    actions: [
                      AppTextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Ok"),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.help_outline_rounded),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 120),
        itemCount: contentPage.length,
        itemBuilder: (context, index) => contentPage[index],
        separatorBuilder: (context, index) => const SizedBox(height: 25),
      ),
    );
  }
}
