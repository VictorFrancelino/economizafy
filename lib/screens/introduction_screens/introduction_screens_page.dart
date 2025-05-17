import 'package:economizafy/utils/app_colors.dart';
import 'package:economizafy/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionScreens extends StatelessWidget {
  const IntroductionScreens({super.key, required this.onIntroComplete});

  final VoidCallback onIntroComplete;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>();
    final defineTextColorBasedAppBrightness =
        Theme.of(context).brightness == Brightness.light
            ? colors!.black
            : colors!.white;

    final List<PageViewModel> pages = [
      PageViewModel(
        decoration: PageDecoration(
          pageMargin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
        titleWidget: Column(
          children: [
            Text(
              "Bem-vindo(a) ao",
              style: TextStyle(
                color: defineTextColorBasedAppBrightness,
                fontSize: 16,
              ),
            ),
            Text(
              "Economizafy",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        bodyWidget: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(fontSize: 16),
            children: [
              TextSpan(
                text: "O aplicativo feito para você consertar sua ",
                style: TextStyle(color: defineTextColorBasedAppBrightness),
              ),
              TextSpan(
                text: "vida financeira.",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: colors.violet,
                ),
              ),
            ],
          ),
        ),
        image: SvgPicture.asset(
          "assets/images/introduction_1.svg",
          semanticsLabel: "",
          height: 200,
        ),
      ),
      PageViewModel(
        decoration: PageDecoration(
          pageMargin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
        titleWidget: Text(
          "Controle Seus Gastos",
          style: TextStyle(
            color: defineTextColorBasedAppBrightness,
            fontWeight: FontWeight.w500,
            fontSize: 32,
          ),
          textAlign: TextAlign.center,
        ),
        bodyWidget: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(fontSize: 16),
            children: [
              TextSpan(
                text: "Acompanhe suas despesas e economize para o que ",
                style: TextStyle(color: defineTextColorBasedAppBrightness),
              ),
              TextSpan(
                text: "realmente importa.",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: colors.violet,
                ),
              ),
            ],
          ),
        ),
        image: SvgPicture.asset(
          "assets/images/introduction_2.svg",
          semanticsLabel: "",
          height: 200,
        ),
      ),
      PageViewModel(
        decoration: PageDecoration(
          pageMargin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
        titleWidget: Text(
          "Alcance Suas Metas",
          style: TextStyle(
            color: defineTextColorBasedAppBrightness,
            fontWeight: FontWeight.w500,
            fontSize: 32,
          ),
          textAlign: TextAlign.center,
        ),
        bodyWidget: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: TextStyle(fontSize: 16),
            children: [
              TextSpan(
                text: "Crie cronogramas personalizados e transforme seu ",
                style: TextStyle(color: defineTextColorBasedAppBrightness),
              ),
              TextSpan(
                text: "futuro financeiro.",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: colors.violet,
                ),
              ),
            ],
          ),
        ),
        image: SvgPicture.asset(
          "assets/images/introduction_3.svg",
          semanticsLabel: "",
          height: 200,
        ),
      ),
    ];

    return IntroductionScreen(
      pages: pages,
      showNextButton: true,
      showDoneButton: true,
      showSkipButton: true,
      done: AppTextButton(
        onPressed: onIntroComplete,
        addMargin: false,
        child: Text("Começar"),
      ),
      skip: AppTextButton(
        onPressed: onIntroComplete,
        addMargin: false,
        child: Text("Pular"),
      ),
      onSkip: onIntroComplete,
      onDone: onIntroComplete,
      allowImplicitScrolling: true,
      next: Icon(
        Icons.keyboard_arrow_right_rounded,
        color: defineTextColorBasedAppBrightness,
      ),
      dotsDecorator: DotsDecorator(
        activeColor: colors.violet,
        color:
            Theme.of(context).brightness == Brightness.light
                ? colors.black.withAlpha(25)
                : colors.white.withAlpha(25),
      ),
    );
  }
}
