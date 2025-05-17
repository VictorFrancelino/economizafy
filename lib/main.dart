import 'package:economizafy/screens/authentication/authentication_page.dart';
import 'package:economizafy/screens/introduction_screens/introduction_screens_page.dart';
import 'package:economizafy/screens/main_screen.dart';
import 'package:economizafy/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

// TODO: definir as cores dos textos, ícones e outras coisas no light e dark mode

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _introSeen = false;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((p) {
      final seen = p.getBool("hasSeenIntro") ?? false;
      setState(() => _introSeen = seen);
    });
  }

  void _markIntroDone() async {
    final p = await SharedPreferences.getInstance();
    await p.setBool("hasSeenIntro", true);
    setState(() => _introSeen = true);
  }

  @override
  Widget build(BuildContext context) {
    var lightColors = AppColors(
      violet: Color(0xFF5F3DC4),
      red: Color(0xFFC92A2A),
      gray: Color(0xFFE9ECEF),
    );

    var darkColors = AppColors(
      violet: Color(0xFF9F73FF),
      red: Color(0xFFFF6065),
      gray: Color(0xFF343A40),
    );

    return MaterialApp(
      title: 'Economizafy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        drawerTheme: DrawerThemeData(backgroundColor: lightColors.white),
        fontFamily: "Roboto",
        brightness: Brightness.light,
        scaffoldBackgroundColor: lightColors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: lightColors.white,
          surfaceTintColor: lightColors.white,
          titleTextStyle: TextStyle(
            color: lightColors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          shape: Border(bottom: BorderSide(color: lightColors.gray, width: 2)),
        ),
        extensions: <ThemeExtension<dynamic>>[lightColors],
      ),
      darkTheme: ThemeData(
        drawerTheme: DrawerThemeData(backgroundColor: darkColors.black),
        fontFamily: "Roboto",
        brightness: Brightness.dark,
        scaffoldBackgroundColor: darkColors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: darkColors.black,
          surfaceTintColor: darkColors.black,
          titleTextStyle: TextStyle(
            color: lightColors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          shape: Border(bottom: BorderSide(color: darkColors.gray, width: 2)),
        ),
        extensions: <ThemeExtension<dynamic>>[darkColors],
      ),
      home:
          _introSeen
              ? const ScreenRouter()
              : IntroductionScreens(onIntroComplete: _markIntroDone),
    );
  }
}

class ScreenRouter extends StatelessWidget {
  const ScreenRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        return snapshot.hasData
            ? const MainScreen()
            : const AuthenticationPage();
      },
    );
  }
}
