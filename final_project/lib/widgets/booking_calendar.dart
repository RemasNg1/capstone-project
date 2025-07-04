import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BookingCalendar extends StatefulWidget {
  final void Function(String)? onDateSelected;
  const BookingCalendar({super.key, this.onDateSelected});

  @override
  State<BookingCalendar> createState() => _BookingCalendarState();
}

class _BookingCalendarState extends State<BookingCalendar> {
  final int serviceLocationId = 3; // This should be dynamically
  DateTime selectedMonth = DateTime.now();
  final Set<DateTime> unavailableDates = {}; // Local set of unavailable days
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    final daysInMonth = DateUtils.getDaysInMonth(
      selectedMonth.year,
      selectedMonth.month,
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Top month & year selector row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => setState(() {
                    selectedMonth = DateTime(
                      selectedMonth.year,
                      selectedMonth.month - 1,
                    );
                  }),
                  icon: const Icon(Icons.chevron_left),
                ),
                Text(
                  DateFormat.MMMM().format(selectedMonth),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(width: 8),
                DropdownButton<int>(
                  value: selectedMonth.year,
                  underline: const SizedBox(),
                  items: List.generate(5, (index) {
                    final year = DateTime.now().year + index;
                    return DropdownMenuItem(
                      value: year,
                      child: Text(
                        '$year',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    );
                  }),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        selectedMonth = DateTime(value, selectedMonth.month);
                      });
                    }
                  },
                ),
                IconButton(
                  onPressed: () => setState(() {
                    selectedMonth = DateTime(
                      selectedMonth.year,
                      selectedMonth.month + 1,
                    );
                  }),
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
            AppSpacing.h16,

            // Weekday labels (Sun, Mon, ...)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(7, (index) {
                return Text(
                  DateFormat.E().format(DateTime(2020, 1, 5 + index)),
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold),
                );
              }),
            ),

            AppSpacing.h16,

            // Calendar grid showing the days
            Expanded(
              child: GridView.builder(
                itemCount: daysInMonth,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final day = DateTime(
                    selectedMonth.year,
                    selectedMonth.month,
                    index + 1,
                  );
                  final isUnavailable = unavailableDates.contains(day);

                  final isInRange =
                      startDate != null &&
                      endDate != null &&
                      !day.isBefore(startDate!) &&
                      !day.isAfter(endDate!);

                  final isStartOnly =
                      startDate != null && endDate == null && day == startDate;

                  final bgColor = isUnavailable
                      ? Theme.of(context).colorScheme.error.withOpacity(0.5)
                      : isInRange || isStartOnly
                      ? Theme.of(context).colorScheme.primary.withOpacity(0.4)
                      : Theme.of(context).colorScheme.surfaceVariant;

                  return GestureDetector(
                    onTap: () => _handleDayTap(day),
                    child: Container(
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text('${index + 1}'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Handles when the user taps a day
  void _handleDayTap(DateTime day) {
    setState(() {
      if (startDate == null || (startDate != null && endDate != null)) {
        startDate = day;
        endDate = null;
      } else if (startDate != null && endDate == null) {
        if (day.isBefore(startDate!)) {
          endDate = startDate;
          startDate = day;
        } else {
          endDate = day;
        }
        _showAvailabilityBottomSheet();
      }
    });
  }

  /// Shows the bottom sheet to select availability
  void _showAvailabilityBottomSheet() {
    bool tempUnavailable = true;

    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'calendar.change_availability'.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    startDate!.isAtSameMomentAs(endDate!)
                        ? DateFormat.yMMMd().format(startDate!)
                        : "${DateFormat.yMMMd().format(startDate!)} → ${DateFormat.yMMMd().format(endDate!)}",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Toggle buttons for Available/Unavailable
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).colorScheme.surfaceVariant,
                    ),
                    child: Row(
                      children: [
                        _buildToggleButton(
                          context,
                          label: 'calendar.unavailable'.tr(),
                          active: tempUnavailable,
                          color: AppColors.contentColorRed,
                          onTap: () =>
                              setModalState(() => tempUnavailable = true),
                        ),
                        _buildToggleButton(
                          context,
                          label: 'calendar.available'.tr(),
                          active: !tempUnavailable,
                          color: AppColors.blue,
                          onTap: () =>
                              setModalState(() => tempUnavailable = false),
                        ),
                      ],
                    ),
                  ),

                  AppSpacing.h24,

                  // Confirm button: Save to Supabase
                  Row(
                    children: [
                      // Cancel on the left
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              startDate = null;
                              endDate = null;
                            });
                            Navigator.pop(context);
                          },
                          child: Text('calendar.cancel'.tr()),
                        ),
                      ),
                      AppSpacing.w16,
                      // Confirm on the right
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (startDate == null) return;
                            endDate ??= startDate;

                            final supabase = Supabase.instance.client;
                            final start = DateFormat(
                              'yyyy-MM-dd',
                            ).format(startDate!);
                            final end = DateFormat(
                              'yyyy-MM-dd',
                            ).format(endDate!);

                            try {
                              if (tempUnavailable) {
                                await supabase.from('disabled_dates').insert({
                                  'start_date': start,
                                  'end_date': end,
                                  'service_location_id': serviceLocationId,
                                });

                                setState(() {
                                  for (
                                    var day = startDate!;
                                    day.isBefore(
                                      endDate!.add(const Duration(days: 1)),
                                    );
                                    day = day.add(const Duration(days: 1))
                                  ) {
                                    unavailableDates.add(
                                      DateTime(day.year, day.month, day.day),
                                    );
                                  }
                                });
                              } else {
                                await supabase
                                    .from('disabled_dates')
                                    .delete()
                                    .match({
                                      'start_date': start,
                                      'end_date': end,
                                      'service_location_id': serviceLocationId,
                                    });

                                setState(() {
                                  for (
                                    var day = startDate!;
                                    day.isBefore(
                                      endDate!.add(const Duration(days: 1)),
                                    );
                                    day = day.add(const Duration(days: 1))
                                  ) {
                                    unavailableDates.remove(
                                      DateTime(day.year, day.month, day.day),
                                    );
                                  }
                                });
                              }

                              if (tempUnavailable &&
                                  widget.onDateSelected != null) {
                                final selectedText =
                                    startDate!.isAtSameMomentAs(endDate!)
                                    ? DateFormat.yMMMd().format(startDate!)
                                    : '${DateFormat.yMMMd().format(startDate!)} → ${DateFormat.yMMMd().format(endDate!)}';
                                widget.onDateSelected!(selectedText);
                              }

                              if (mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'calendar.saved_successfully'.tr(),
                                    ),
                                  ),
                                );
                                Navigator.pop(context);
                              }
                            } catch (error) {
                              debugPrint('Supabase Error: $error');
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('calendar.not_saved'.tr()),
                                ),
                              );
                            }

                            setState(() {
                              startDate = null;
                              endDate = null;
                            });
                          },
                          child: Text('calendar.confirm'.tr()),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  /// Builds a single toggle button (Available/Unavailable)
  Widget _buildToggleButton(
    BuildContext context, {
    required String label,
    required bool active,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: active ? color : Colors.transparent,
            borderRadius: label == 'Unavailable'
                ? const BorderRadius.horizontal(left: Radius.circular(30))
                : const BorderRadius.horizontal(right: Radius.circular(30)),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: active
                  ? Colors.white
                  : Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
