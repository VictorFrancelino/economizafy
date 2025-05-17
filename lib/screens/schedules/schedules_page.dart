import 'package:economizafy/screens/schedules/widgets/schedules_list.dart';
import 'package:economizafy/screens/schedules/widgets/schedules_filter.dart';
import 'package:economizafy/widgets/app_text_button.dart';
import 'package:flutter/material.dart';

class SchedulesPage extends StatelessWidget {
  const SchedulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cronogramas"),
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
                      "Essa página serve para exibir os dados de economias",
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
      body: Column(
        children: [
          const SchedulesFilter(),
          const SizedBox(height: 25),
          Expanded(child: const SchedulesList()),
        ],
      ),
    );
  }
}
