import 'dart:math';
import 'dart:ui';

import 'package:final_project/models/services_models/service_rating/service_rating_model.dart';
import 'package:final_project/models/services_models/services_provided/services_provided_model.dart';
import 'package:final_project/models/temp_bookin/message_temp_model.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

//-------------------- UnavailableDays --------------------

Set<DateTime> getUnavailableDays(ServicesProvidedModel service) {
  final requestDates = service.serviceRequests == null
      ? <DateTime>{}
      : service.serviceRequests!
            .where(
              (r) =>
                  r.date != null &&
                  (r.status == 'accepted' || r.status == 'send'),
            )
            .map((r) => DateTime(r.date!.year, r.date!.month, r.date!.day))
            .toSet();

  final disabledRangeDates = <DateTime>{};

  for (var loc in service.locations ?? []) {
    for (var dis in loc.disabledDates ?? []) {
      DateTime current = dis.startDate;
      while (!current.isAfter(dis.endDate)) {
        disabledRangeDates.add(
          DateTime(current.year, current.month, current.day),
        );
        current = current.add(Duration(days: 1));
      }
    }
  }

  final today = DateTime.now();
  DateTime current = DateTime(2025, 1, 1);

  while (current.isBefore(DateTime(today.year, today.month, today.day))) {
    disabledRangeDates.add(DateTime(current.year, current.month, current.day));
    current = current.add(Duration(days: 1));
  }

  return requestDates.union(disabledRangeDates);
}

//-------------------- rating part --------------------

double calculateAverageRating(List<ServiceRatingModel> ratings) {
  if (ratings.isEmpty) return 0.0;

  var validRatings = ratings.where((r) => r.rating != null).toList();
  if (validRatings.isEmpty) return 0.0;

  double sum = validRatings.map((r) => r.rating!).reduce((a, b) => a + b);
  return sum / validRatings.length;
}

//-------------------- chat part --------------------

List<MessageTempModel> getUnique() {
  // here there is a bug  we should fucus on message.user.id and message.providerId (watch  one is provider and user )

  // this function to get one message from each user
  List<MessageTempModel> conversationList = [];
  Set<int> seenUserIds = {};
  for (var message in messages) {
    if (!seenUserIds.contains(message.user.id)) {
      conversationList.add(message);
      seenUserIds.add(message.user.id);
    }
  }
  return conversationList;
}

//-------------------- chart part --------------------
// Creates chart bars from values
List<BarChartGroupData> makeGroupDataStatic({
  required List<double> valuesToDisplay,
  required double width,
}) {
  Color barColor = AppColors.mediumBlue;
  int count = 0;

  return valuesToDisplay.map((value) {
    return BarChartGroupData(
      barsSpace: 4,
      x: count++,
      barRods: [
        BarChartRodData(
          toY: scaleValue(value), // Scaled height
          color: barColor,
          width: width,
        ),
      ],
    );
  }).toList();
}

// Scales a value (logarithmic) to fit chart height
double scaleValue(num x) {
  if (x <= 0) return 0;
  double logValue = log(x) / ln10;
  double scaled = (logValue - 3) * (19 / 3) + 1;
  return scaled.clamp(0, 20); // Keep between 0 and 20
}

// Converts scaled Y value to readable label
String leftSideIncomingTitle(num scaledValue) {
  int rounded = scaledValue.round();
  if (rounded == 1) return '1K';
  if (rounded == 11) return '10K';
  if (rounded == 15) return '100K';
  if (rounded == 18) return '500K';
  if (rounded == 20) return '1M>';
  return '';
}
