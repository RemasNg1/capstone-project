// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:final_project/data_layer/booking_layer.dart';
// import 'package:final_project/models/booking/model_bookin_images.dart';
// import 'package:meta/meta.dart';

// part 'booking_image_event.dart';

// class BookingImageBloc extends Bloc<BookingImageEvent, BookingImageState> {
//   String imageUrl = 'https://static.hiamag.com/styles/autox754/public/article/22/09/2021/%D9%85%D9%86%20%D8%A7%D9%86%D8%B3%D8%AA%D8%BA%D8%B1%D8%A7%D9%85%20riyadh_palace.jpg';
//   BookingImageBloc() : super(BookingImageInitial()) {
//     on<BookingImageEvent>((event, emit) {});
//     on<LoadImage>(loadImage);
//   }

//   FutureOr<void> loadImage(LoadImage event, Emitter<BookingImageState> emit) async{
//     print('loadImage');
//     emit(BookingImageLoading());
//    List<ModelBookingImages> allImages= await  BookingLayer.getImageOfServiceProvided(
//       provideServiceId: event.serviceProviderId,
//     );
//     print(allImages[0].imageUrl);
//     imageUrl=allImages[0].imageUrl!;
//     emit(BookingImageLoadingSuccessfully());
//   }
// }
