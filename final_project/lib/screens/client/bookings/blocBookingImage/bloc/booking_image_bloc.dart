import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:final_project/data_layer/booking_layer.dart';
import 'package:final_project/models/booking/model_bookin_images.dart';
import 'package:meta/meta.dart';

part 'booking_image_event.dart';
part 'booking_image_state.dart';

class BookingImageBloc extends Bloc<BookingImageEvent, BookingImageState> {
  String imageUrl = '';
  BookingImageBloc() : super(BookingImageInitial()) {
    on<BookingImageEvent>((event, emit) {});
    on<LoadImage>(loadImage);
  }

  FutureOr<void> loadImage(
    LoadImage event,
    Emitter<BookingImageState> emit,
  ) async {
    print('loadImage');
    emit(BookingImageLoading());
    List<ModelBookingImages> allImages =
        await BookingLayer.getImageOfServiceProvided(
          provideServiceId: event.serviceProviderId,
        );
    print(allImages[0].imageUrl);
    imageUrl = allImages[0].imageUrl!;
    emit(BookingImageLoadingSuccessfully());
  }
}
