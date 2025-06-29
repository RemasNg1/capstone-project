import 'dart:math';
import 'dart:ui';

import 'package:final_project/core/enum/types.dart';
import 'package:final_project/models/temp_bookin/booking_temp_model.dart';
import 'package:final_project/models/temp_bookin/message_temp_model.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

//-------------------- Booking part --------------------

List<BookingTempModel> getBookingWithSameStatus(
  List<BookingTempModel> bookingList,
  EnumBookingStatus status,
) {
  return bookingList.where((booking) => booking.status == status).toList();
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

List<BarChartGroupData> makeGroupDataStatic({
  required List<int> valuesToDisplay,
  required double width,
}) {
  Color barColor = AppColors.contentColorYellow;
  int count = 0;
  return valuesToDisplay.map((value) {
    BarChartGroupData bar = BarChartGroupData(
      barsSpace: 4,
      x: count,
      barRods: [BarChartRodData(toY:scaleValue(value) , color: barColor, width: width)],
    );
    count++;

    return bar;
  }).toList();
}


/// تقوم هذه الدالة بتحويل قيمة رقمية إلى قيمة من 1 إلى 20 بشكل لوغاريتمي
double scaleValue(num x) {
  // إذا كانت القيمة أقل من أو تساوي صفر، نرجع 0 لتجنب الخطأ
  if (x <= 0) return 0;

  // نحسب اللوغاريتم العشري للقيمة x
  // log(x) / ln10 يعطينا log10(x)
  double logValue = log(x) / ln10;

  // نحول النتيجة من النطاق [3 → 6] ( من 1000 إلى 1000000)
  // إلى النطاق [1 → 20] باستخدام معادلة تحويل خطي
  double scaled = (logValue - 3) * (19 / 3) + 1;

  // نضمن أن القيمة النهائية لا تتعدى النطاق [0 → 20]
  return scaled.clamp(0, 20);
}
// this set title of incoming chart
String leftSideIncomingTitle(num scaledValue) {
  int rounded = scaledValue.round();

  if (rounded == 1) {
    return '1K';
  } else if (rounded == 11) {
    return '10K';
  } 
   else if (rounded == 15) {
    return '100K';
  } else if (rounded == 18) {
    return '500K';
  } else if (rounded == 20) {
    return '1M>';
  } else {
    return '';
  }
}

