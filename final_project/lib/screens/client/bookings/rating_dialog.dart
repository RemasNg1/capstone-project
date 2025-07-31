import 'package:easy_localization/easy_localization.dart';
import 'package:final_project/core/constant/app_validation.dart';
import 'package:final_project/screens/client/bookings/bloc/bookings_bloc.dart';
import 'package:final_project/style/app_buttons.dart';
import 'package:final_project/style/app_colors.dart';
import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:final_project/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatingDialog extends StatelessWidget {
  final int serviceId;
  final int bookingId;

  const RatingDialog({
    super.key,
    required this.serviceId,
    required this.bookingId,
  });

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<BookingsBloc>();

    return AlertDialog(
      // backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titlePadding: EdgeInsets.zero,
      title: SizedBox(
        height: 48,

        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                'bookings.rate_service'.tr(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.grey),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          height: context.getHeight(factor: 0.22),
          width: context.getWidth(factor: 0.6),

          child: Form(
            key: bloc.ratingsFormKey,
            child: Column(
              children: [
                BlocBuilder<BookingsBloc, BookingsState>(
                  builder: (context, state) {
                    final bloc = context.read<BookingsBloc>();
                    int selectedRating = bloc.selectedRating;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: IconButton(
                              constraints: BoxConstraints(),
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                bloc.add(RatingChangedEvent(index + 1));
                              },
                              icon: Icon(
                                Icons.star,
                                color: index < selectedRating
                                    ? AppColors.blue
                                    : Colors.grey,
                                size: 42,
                              ),
                            ),
                          );
                        }),
                      ),
                    );
                  },
                ),

                AppSpacing.h32,

                CustomTextFormField(
                  labelText: "bookings.write_note".tr(),
                  icon: Icon(CupertinoIcons.doc),
                  controller: bloc.notesController,
                  validator: AppValidation.requiredField,
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
      ),

      actions: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              if (bloc.ratingsFormKey.currentState!.validate()) {
                print(
                  "ID: ${serviceId} ,Rating: ${bloc.selectedRating}, Note: ${bloc.notesController.text}",
                );
                bloc.add(
                  SubmitServiceRating(
                    serviceProvidedId: serviceId,
                    bookingId: bookingId,
                    note: bloc.notesController.text,
                    rating: bloc.selectedRating.toDouble(),
                  ),
                );
                Navigator.pop(context);
              }
            },
            style: AppButtons.medium,
            child: Text(
              'bookings.submit_rating'.tr(),
              style: AppTextStyles.interSize16(context),
            ),
          ),
        ),
      ],
    );
  }
}
