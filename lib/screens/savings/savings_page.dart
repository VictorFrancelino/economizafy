import 'package:economizafy/screens/savings/widgets/checkins_carried_out.dart';
import 'package:economizafy/screens/savings/widgets/date_picker.dart';
import 'package:economizafy/screens/savings/widgets/value_saved.dart';
import 'package:economizafy/widgets/app_text_button.dart';
import 'package:flutter/material.dart';

class SavingsPage extends StatelessWidget {
  const SavingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> contentPage = [
      DatePicker(),
      ValueSaved(),
      CheckinsCarriedOut(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Economias"),
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
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 120),
        itemCount: contentPage.length,
        itemBuilder: (context, index) => contentPage[index],
        separatorBuilder: (context, index) => const SizedBox(height: 25),
      ),
    );
  }
}
