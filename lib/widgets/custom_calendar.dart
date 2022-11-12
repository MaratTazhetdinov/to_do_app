import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/theme/app_theme.dart';
import 'package:to_do_app/to_do_add_page/date_state_manager.dart';

// ignore: must_be_immutable
class CustomCalendar extends StatelessWidget {
  WidgetRef ref;

  CustomCalendar({required this.ref});

  @override
  Widget build(BuildContext context) {
    DateTime _focusedDay = DateTime.now();

    DateTime _selectedDay =
        ref.read(dateStateManagerProvider.notifier).date == null
            ? DateTime.now()
            : ref.read(dateStateManagerProvider.notifier).date!;

    return TableCalendar(
      focusedDay: _focusedDay,
      selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
      firstDay: _focusedDay,
      lastDay: DateTime.utc(2030, 12, 31),
      availableCalendarFormats: {CalendarFormat.month: 'Month'},
      onDaySelected: (selectedDay, focusedDay) {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        ref.read(dateStateManagerProvider.notifier).dateChanged(selectedDay);
        Navigator.of(context).pop();
      },
      headerStyle: HeaderStyle(
          titleCentered: true,
          titleTextStyle: TextStyle(
              color: Colors.yellow, fontSize: 14, fontWeight: FontWeight.w600),
          leftChevronIcon: SvgPicture.asset('assets/back_chevron_icon.svg',
              color: Colors.yellow),
          rightChevronIcon: SvgPicture.asset('assets/next_chevron_icon.svg',
              color: Colors.yellow)),
      daysOfWeekStyle: DaysOfWeekStyle(
          weekendStyle: TextStyle(
              color: Colors.grey,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              fontFamily: 'SF Pro Text Regular'),
          weekdayStyle: TextStyle(
              color: Colors.grey,
              fontSize: 13,
              fontWeight: FontWeight.w600,
              fontFamily: 'SF Pro Text Regular')),
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
          outsideDaysVisible: false,
          defaultTextStyle: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
          weekendTextStyle: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
          disabledTextStyle: TextStyle(
              color: Colors.white60, fontSize: 16, fontWeight: FontWeight.w400),
          isTodayHighlighted: true,
          selectedDecoration: BoxDecoration(
              color: AppTheme.colors.yellow, shape: BoxShape.circle),
          selectedTextStyle: TextStyle(color: AppTheme.colors.black)),
    );
  }
}
