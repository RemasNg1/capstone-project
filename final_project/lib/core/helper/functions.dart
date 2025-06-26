
import 'package:final_project/core/enum/types.dart';
import 'package:final_project/models/temp_bookin/booking_temp_model.dart';
import 'package:final_project/models/temp_bookin/message_temp_model.dart';

List<BookingTempModel> getBookingWithSameStatus(
  List<BookingTempModel> bookingList,
  EnumBookingStatus status,
) {
  return bookingList.where((booking) => booking.status == status).toList();
}


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
