import 'package:economizafy/screens/new_schedule/widgets/new_schedule_actions.dart';
import 'package:economizafy/screens/new_schedule/widgets/checkin_type_form.dart';
import 'package:economizafy/screens/new_schedule/widgets/description_form.dart';
import 'package:economizafy/screens/new_schedule/widgets/goals_form.dart';
import 'package:economizafy/screens/new_schedule/widgets/name_form.dart';
import 'package:economizafy/screens/new_schedule/widgets/tag_form.dart';
import 'package:flutter/material.dart';

class NewSchedulePage extends StatelessWidget {
  const NewSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController goalsController = TextEditingController();
    final TextEditingController checkinController = TextEditingController();

    final List<Widget> contentPage = [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          "Crie um novo cronograma e consiga o dinheiro necessário para conquistar seus sonhos",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      NameForm(controller: nameController),
      DescriptionForm(controller: descriptionController),
      TagForm(),
      GoalsForm(controller: goalsController),
      CheckinTypeForm(controller: checkinController),
      NewScheduleActions(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Cronograma"),
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
                    title: Text("O que é essa página?"),
                    content: Text(
                      "Essa página serve para exibir os dados do cronograma escolhido",
                    ),
                    actions: [
                      TextButton(
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
