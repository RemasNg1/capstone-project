import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/models/booking/model_booking.dart';
import 'package:final_project/core/enum/types.dart';
import 'package:final_project/screens/client/bookings/bloc/bookings_bloc.dart';
import 'package:final_project/screens/client/bookings/blocBookingImage/bloc/booking_image_bloc.dart';
import 'package:final_project/screens/client/bookings/rating_dialog.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/utils/extensions/localization_helper.dart';
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
    var bloc = context.read<BookingsBloc>();

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
          ),
        ],
      ),
      padding: EdgeInsets.all(12),
      height: context.getHeight(factor: 0.155),
      width: context.getWidth(),
      child: Row(
        spacing: 16,
        children: [
          Builder(
            builder: (context) {
              var bloc = context.read<BookingImageBloc>();

              return BlocBuilder<BookingImageBloc, BookingImageState>(
                builder: (context, state) {
                  if (state is BookingImageInitial) {
                    bloc.add(
                      LoadImage(serviceProviderId: item.serviceProvidedId!),
                    );
                  }
                  return Container(
                    width: 110,
                    height: 116,
                    decoration: BoxDecoration(
                      color: bloc.imageUrl.isEmpty
                          ? AppColors.gray
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: NetworkImage(
                          bloc.imageUrl.isEmpty ? '' : bloc.imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              );
            },
          ),
          SizedBox(
            width: context.getWidth(factor: 0.6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      context.isArabic
                          ? item.servicesProvided?.titleAr ?? "."
                          : item.servicesProvided?.titleEn ?? "",

                      style: AppTextStyles.interSize16(context).copyWith(),
                    ),
                  ],
                ),
                AppSpacing.h8,
                Text.rich(
                  TextSpan(
                    text: "${'bookings.order_status'.tr()}: ",
                    style: AppTextStyles.interSize14(
                      context,
                    ).copyWith(color: AppColors.mediumGray),
                    children: [
                      TextSpan(
                        text: 'bookings.${item.status}'.tr(),
                        style: AppTextStyles.interSize14(context).copyWith(
                          color: item.status == 'send'
                              ? Colors.orange
                              : item.status == 'rejected'
                              ? Colors.red
                              : item.status == 'accepted'
                              ? Colors.green
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                AppSpacing.h4,

                // paid_amount
                Text.rich(
                  TextSpan(
                    text: "${'bookings.paid_amount'.tr()}: ",
                    style: AppTextStyles.interSize14(
                      context,
                    ).copyWith(color: AppColors.mediumGray),
                    children: [
                      TextSpan(
                        text: item.servicesProvided!.price!.toString(),
                        style: AppTextStyles.interSize14(context).copyWith(),
                      ),
                    ],
                  ),
                ),
                AppSpacing.h4,

                Text(
                  item.date!,
                  style: AppTextStyles.interSize14(
                    context,
                  ).copyWith(color: AppColors.mediumGray),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (item.status == EnumBookingStatus.accepted.name)
                      CustomRowIconTitle(
                        icon: Icon(Icons.star_outline, color: AppColors.blue),
                        title: "bookings.rate_service".tr(),
                        // onTap: onTapRating,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) => BlocProvider.value(
                              value: bloc,
                              child: RatingDialog(
                                serviceId: item.serviceProvidedId!,
                              ),
                            ),
                          );

                          // showDialog(
                          //   context: context,
                          //   builder: (context) {
                          //     return RatingDialog();
                          // AlertDialog(
                          //   title: Text('Rating'),
                          //   content: Column(
                          //     mainAxisSize: MainAxisSize.min,
                          //     children: [
                          //       Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.center,
                          //         children: List.generate(5, (index) {
                          //           return const Icon(
                          //             Icons.star,
                          //             color: Colors.grey,
                          //             size: 32,
                          //           );
                          //         }),
                          //       ),
                          //       const SizedBox(height: 16),
                          //       const TextField(
                          //         maxLines: 3,
                          //         decoration: InputDecoration(
                          //           hintText: 'اكتب ملاحظاتك هنا...',
                          //           border: OutlineInputBorder(),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          //   actions: [
                          //     ElevatedButton(
                          //       onPressed: () {},
                          //       style: AppButtons.small,
                          //       child: Text(
                          //         'home.send'.tr(),
                          //         style: AppTextStyles.interSize16(context),
                          //       ),
                          //     ),
                          //     // TextButton(
                          //     //   onPressed: () {
                          //     //     Navigator.pop(context);
                          //     //   },
                          //     //   child: const Text('Cancel'),
                          //     // ),
                          //     // ElevatedButton(
                          //     //   onPressed: () {
                          //     //     Navigator.pop(context);
                          //     //   },
                          //     //   child: const Text('Send'),
                          //     // ),
                          //   ],
                          // );
                          // },
                          // );
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
