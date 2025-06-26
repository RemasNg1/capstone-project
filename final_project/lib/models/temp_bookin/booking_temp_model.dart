import 'package:final_project/core/enum/types.dart';
class BookingTempModel {
  final int id;
  final String title;
  final String imageUrl;
  bool isEnableRating;
  final EnumBookingStatus status;
  final String date;

  BookingTempModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.isEnableRating = true,
    required this.status,
    required this.date,
  });
}

final List<BookingTempModel> bookingList = [
  BookingTempModel(
    id: 1,
    title: 'This is a long text asdfasdf asdfa asdfa sdfa sdf ',
    imageUrl:
        "https://abia.com.au/abia-admin/ckfinder/userfiles/images/wedding-venues-queensland-Gabbinbar-Homestead.webp",
    isEnableRating: true,
    status: EnumBookingStatus.send,
    date: '28/06/2025',
  ),
  BookingTempModel(
    id: 2,
    title: 'Android Dev Event',
    imageUrl:
        "https://abia.com.au/abia-admin/ckfinder/userfiles/images/wedding-venues-queensland-Gabbinbar-Homestead.webp",
    isEnableRating: false,
    status: EnumBookingStatus.send,
    date: '25/06/2025',
  ),
  BookingTempModel(
    id: 3,
    title: 'Conference Room View',
    imageUrl:
        "https://abia.com.au/abia-admin/ckfinder/userfiles/images/wedding-venues-queensland-Gabbinbar-Homestead.webp",
    isEnableRating: true,
    status: EnumBookingStatus.accepted,
    date: '15/05/2025',
  ),
  BookingTempModel(
    id: 4,
    title: 'Abstract Art Gallery',
    imageUrl:
        "https://abia.com.au/abia-admin/ckfinder/userfiles/images/wedding-venues-queensland-Gabbinbar-Homestead.webp",
    isEnableRating: true,
    status: EnumBookingStatus.accepted,
    date: '10/01/2025',
  ),
  BookingTempModel(
    id: 5,
    title: 'Red Square Exhibit',
    imageUrl:
        "https://abia.com.au/abia-admin/ckfinder/userfiles/images/wedding-venues-queensland-Gabbinbar-Homestead.webp",
    isEnableRating: false,
    status: EnumBookingStatus.rejected,
    date: '05/07/2025',
  ),
];
