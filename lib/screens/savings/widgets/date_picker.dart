import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:economizafy/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  // TODO: estilizar as bordas dos dias e arrumar o backgroundColor do dia atual
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>();
    var disabledDayBackgroundColor =
        Theme.of(context).brightness == Brightness.light
            ? colors!.white
            : colors!.black;

    return EasyTheme(
      data: EasyTheme.of(context).copyWith(
        dayTopElementStyle: WidgetStateTextStyle.resolveWith((states) {
          return TextStyle();
        }),
        dayMiddleElementStyle: WidgetStateTextStyle.resolveWith((states) {
          return TextStyle();
        }),
        dayBottomElementStyle: WidgetStateTextStyle.resolveWith((states) {
          return TextStyle();
        }),
        dayBorder: WidgetStateBorderSide.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return BorderSide(
              color:
                  Theme.of(context).brightness == Brightness.light
                      ? colors.black
                      : colors.white,
            );
          } else if (states.contains(WidgetState.disabled)) {
            return BorderSide(
              color:
                  Theme.of(context).brightness == Brightness.light
                      ? colors.black
                      : colors.white,
            );
          }

          return null;
        }),
        dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return colors.violet;
          } else if (states.contains(WidgetState.disabled)) {
            return disabledDayBackgroundColor;
          }

          return disabledDayBackgroundColor;
        }),
      ),
      child: EasyDateTimeLinePicker(
        firstDate: DateTime(2025, 4),
        lastDate: DateTime.now(),
        focusedDate: selectedDate,
        headerOptions: HeaderOptions(headerType: HeaderType.picker),
        onDateChange: (date) {
          setState(() {
            selectedDate = date;
          });
        },
        locale: Locale("pt", "BR"),
        selectionMode: SelectionMode.autoCenter(),
      ),
    );
  }
}
