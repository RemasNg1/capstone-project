import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/models/add_service/service_model.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:flutter/material.dart';

class BookingCalendar extends StatefulWidget {
  final int serviceLocationId;
  final void Function(DateTime)? onDateSelected;
  final void Function(List<DateTimeRangeModel>)? onUnavailableDatesChanged;

  const BookingCalendar({
    super.key,
    this.onDateSelected,
    this.onUnavailableDatesChanged,
    required this.serviceLocationId,
  });

  @override
  State<BookingCalendar> createState() => _BookingCalendarState();
}

class _BookingCalendarState extends State<BookingCalendar> {
  DateTime selectedMonth = DateTime.now();
  final Set<DateTime> unavailableDates = {};
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
            // Header
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

            // Days of week
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

            // Calendar days
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

                  // Toggle buttons
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

                  // Confirm button
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (startDate == null) return;
                            endDate ??= startDate;

                            setState(() {
                              for (
                                var day = startDate!;
                                day.isBefore(
                                  endDate!.add(const Duration(days: 1)),
                                );
                                day = day.add(const Duration(days: 1))
                              ) {
                                if (tempUnavailable) {
                                  unavailableDates.add(
                                    DateTime(day.year, day.month, day.day),
                                  );
                                } else {
                                  unavailableDates.remove(
                                    DateTime(day.year, day.month, day.day),
                                  );
                                }
                              }

                              final sortedDates = unavailableDates.toList()
                                ..sort();
                              final List<DateTimeRangeModel> ranges = [];

                              if (sortedDates.isNotEmpty) {
                                DateTime rangeStart = sortedDates.first;
                                DateTime rangeEnd = sortedDates.first;

                                for (int i = 1; i < sortedDates.length; i++) {
                                  final current = sortedDates[i];

                                  if (current.difference(rangeEnd).inDays ==
                                      1) {
                                    rangeEnd = current;
                                  } else {
                                    ranges.add(
                                      DateTimeRangeModel(
                                        start: rangeStart,
                                        end: rangeEnd,
                                      ),
                                    );
                                    rangeStart = current;
                                    rangeEnd = current;
                                  }
                                }

                                ranges.add(
                                  DateTimeRangeModel(
                                    start: rangeStart,
                                    end: rangeEnd,
                                  ),
                                );
                              }
                              widget.onUnavailableDatesChanged?.call(ranges);

                              startDate = null;
                              endDate = null;
                            });

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
