import 'package:economizafy/screens/home/home_page.dart';
import 'package:economizafy/screens/new_schedule/new_schedule_page.dart';
import 'package:economizafy/screens/savings/savings_page.dart';
import 'package:economizafy/screens/schedules/schedules_page.dart';
import 'package:economizafy/services/authentication_service.dart';
import 'package:economizafy/utils/app_colors.dart';
import 'package:economizafy/widgets/app_bottom_navigation_bar.dart';
import 'package:economizafy/widgets/app_text_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final AuthenticationService _authenticationService = AuthenticationService();
  User? get currentUser => FirebaseAuth.instance.currentUser;

  void deleteAccount() async {
    try {
      await _authenticationService.softDeleteUser();
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      debugPrint("Erro ao deletar: $e");
    }
  }

  String get userName {
    return currentUser?.displayName ??
        currentUser?.email?.split("@").first ??
        "Usuário";
  }

  String get joinDate {
    final date = currentUser?.metadata.creationTime;
    if (date == null) return "Data de cadastro não disponível";
    return "Usuário desde ${DateFormat("dd/MM/yyyy").format(date)}";
  }

  final List<Widget> pages = [
    HomePage(),
    SavingsPage(),
    NewSchedulePage(),
    SchedulesPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>();

    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Olá, $userName",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Chip(
                          padding: EdgeInsets.all(0),
                          labelPadding: EdgeInsets.symmetric(horizontal: 5),
                          backgroundColor: colors!.violet.withAlpha(50),
                          side: BorderSide(width: 2, color: colors.violet),
                          label: Text(
                            "Premium",
                            style: TextStyle(
                              color: colors.violet,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      joinDate,
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 15),
                    ListTile(
                      leading: Icon(Icons.lock_outline_rounded),
                      title: Text("Segurança"),
                    ),
                    ListTile(
                      leading: Icon(Icons.accessibility_new_rounded),
                      title: Text("Acessibilidade"),
                    ),
                    ListTile(
                      leading: Icon(Icons.support_rounded),
                      title: Text("Suporte"),
                    ),
                    ListTile(
                      leading: Icon(Icons.bug_report_rounded),
                      title: Text("Relatar um Problema"),
                    ),
                  ],
                ),
                Column(
                  children: [
                    AppTextButton(
                      dangerButton: true,
                      infinityWidth: true,
                      addMargin: false,
                      onPressed: () => _authenticationService.signOut(),
                      child: Text("Sair"),
                    ),
                    AppTextButton(
                      dangerButton: true,
                      infinityWidth: true,
                      backgroundColor: false,
                      addMargin: false,
                      onPressed: () => _authenticationService.signOut(),
                      child: Text("Apagar Conta"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          IndexedStack(index: _currentIndex, children: pages),
          Align(
            alignment: Alignment.bottomCenter,
            child: AppBottomNavigationBar(
              icons: const [
                Icon(Icons.home),
                Icon(Icons.attach_money_rounded),
                Icon(Icons.add_circle_outline_rounded),
                Icon(Icons.format_list_bulleted_rounded),
              ],
              currentIndex: _currentIndex,
              onTap: _onTabTapped,
            ),
          ),
        ],
      ),
    );
  }
}
