import 'package:final_project/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatelessWidget {
  final DateTime selectedDay;
  final Set<DateTime>? selectedDays; // list of booking days
  final Set<DateTime> unavailableDays; // Set of unavailable
  final void Function(DateTime selectedDay)? onDaySelected;

  const CalendarWidget({
    super.key,
    required this.selectedDay,
    required this.unavailableDays,
    this.onDaySelected,

    this.selectedDays,
  });

  // Helper method to check if two DateTime objects refer to the same calendar day
  bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 400,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(17),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightGray,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      // Main calendar UI
      child: TableCalendar(
        firstDay: DateTime.utc(2025),
        lastDay: DateTime.utc(2030),
        focusedDay: selectedDay, // Initially focused day (current month)
        // Highlight the selected day
        selectedDayPredicate:
            // if a pass selected date then will halite this days else will halite only current day
            (day) {
              return selectedDays != null
                  ? selectedDays!.any((d) => isSameDay(d, day))
                  : isSameDay(day, selectedDay);
            },

        calendarFormat: CalendarFormat.month, // Month view only
        availableGestures: AvailableGestures.all, // Allow swipe gestures

        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),

        calendarStyle: CalendarStyle(
          todayTextStyle: TextStyle(color: Colors.black),
          todayDecoration: BoxDecoration(),
          selectedDecoration: BoxDecoration(
            color: selectedDays != null
                ? AppColors.contentColorYellow
                : AppColors.blue,
            shape: selectedDays != null
                ? BoxShape.rectangle
                : BoxShape.rectangle,
          ),
          weekendTextStyle: const TextStyle(color: Colors.black),
          defaultTextStyle: const TextStyle(color: Colors.black),
        ),

        // Disable dates that are in the unavailable set
        enabledDayPredicate: (day) =>
            !unavailableDays.any((d) => isSameDay(d, day)),

        // Custom UI for each day
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) {
            final isBooked = unavailableDays.any((d) => isSameDay(d, day));
            if (isBooked) {
              return Center(
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.gray,
                  ),
                  child: const Center(
                    child: Icon(Icons.close, size: 16, color: AppColors.black),
                  ),
                ),
              );
            }
            return null;
          },

          disabledBuilder: (context, day, focusedDay) {
            return null;
          },
        ),

        onDaySelected: (selected, focused) {
          if (onDaySelected != null) {
            onDaySelected!(selected);
          }
        },
      ),
    );
  }
}
