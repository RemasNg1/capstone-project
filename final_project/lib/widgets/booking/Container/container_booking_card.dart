import 'package:final_project/data_layer/booking_layer.dart';
import 'package:final_project/models/booking/model_booking.dart';
import 'package:final_project/models/temp_bookin/booking_temp_model.dart';
import 'package:final_project/core/enum/types.dart';
import 'package:final_project/screens/client/bookings/bloc/bookings_bloc.dart';
import 'package:final_project/screens/client/bookings/blocBookingImage/bloc/booking_image_bloc.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:final_project/widgets/booking/row/custom_row_icon_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContainerBookingCard extends StatelessWidget {
  const ContainerBookingCard({
    super.key,
    this.onTapChat,
    this.onTapRating,
    required this.item,
  });
  final ModelBooking item;
  final Function()? onTapChat;
  final Function()? onTapRating;
  @override
  Widget build(BuildContext context) {
    // var bloc=context.read<BookingsBloc>();

    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 2,
            blurRadius: 5,
            // offset: Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(12),
      height: context.getHeight(factor: 0.21),
      width: context.getWidth(),
      child: Row(
        spacing: 16,
        children: [
          Builder(
            builder: (context) {
              var bloc = context.read<BookingImageBloc>();
            
              return BlocBuilder<BookingImageBloc, BookingImageState>(
                builder: (context, state) {
                  if(state is BookingImageInitial){
                    bloc.add(LoadImage(serviceProviderId: item.serviceProvidedId!));
                  }
                  return Container(
                    width: 110,
                    height: 116,
                    decoration: BoxDecoration(
                      color: bloc.imageUrl.isEmpty?AppColors.gray:AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(bloc.imageUrl.isEmpty?'':bloc.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            },
          ),
          SizedBox(
            width: context.getWidth(factor: 0.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.servicesProvided?.titleEn ?? ".",
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
                Text.rich(
                  TextSpan(
                    text: "Order Status :",
                    children: [TextSpan(text: item.status)],
                  ),
                ),
                Text(item.date!),
                // enable rating
                if (item.status == EnumBookingStatus.accepted.name)
                  CustomRowIconTitle(
                    icon: Icon(Icons.stars_outlined),
                    title: "Give Rating",
                    onTap: onTapRating,
                  ),
                CustomRowIconTitle(
                  icon: Icon(Icons.flag_circle_outlined),
                  onTap: onTapChat,
                  title: "Chat with the provider",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
