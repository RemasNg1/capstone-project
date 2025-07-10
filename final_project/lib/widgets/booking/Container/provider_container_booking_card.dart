import 'package:final_project/style/app_spacing.dart';
import 'package:final_project/style/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/screens/service_provider/service_booking2/bloc/service_booking_bloc.dart';
import 'package:final_project/models/booking_model/service_request.dart';

/// A card widget used by the service provider to display booking information.
class ProviderContainerBookingCard extends StatelessWidget {
  final ServiceRequest item;
  final bool showActionButtons; // عرض أزرار الإجراءات (قبول / رفض)
  final VoidCallback? onTapChat;

  const ProviderContainerBookingCard({
    super.key,
    required this.item,
    this.showActionButtons = false,
    this.onTapChat,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 175,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display service image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              item.imageUrl,
              width: 120,
              height: 130,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.broken_image, size: 60),
            ),
          ),
          AppSpacing.w16,

          // Display service information and actions
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Show service title
                  Text(
                    item.serviceTitle,
                    style: AppTextStyles.interSize16(context).copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  AppSpacing.h4,

                  // Show booking status with color and localization
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${'bookings.order_status'.tr()}: ',
                          style: AppTextStyles.interSize12(context).copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          text: ' ${'bookings.${item.status}'.tr()}',
                          style: AppTextStyles.interSize12(context).copyWith(
                            color: _statusColor(context, item.status),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Show booking date
                  Text(
                    DateFormat('d/M/yyyy').format(item.date),
                    style: AppTextStyles.interSize12(
                      context,
                    ).copyWith(color: Theme.of(context).colorScheme.onSurface),
                  ),
                  AppSpacing.h8,

                  // Show accept and cancel buttons if booking is waiting
                  if (showActionButtons && item.status == 'send') ...[
                    AppSpacing.h16,
                    Row(
                      children: [
                        _actionButton(
                          context: context,
                          text: 'bookings.cancel'.tr(),
                          color: Colors.red,
                          onPressed: () {
                            context.read<BookingsBloc>().add(
                              UpdateBookingStatus(item.id, 'rejected'),
                            );
                          },
                        ),
                        AppSpacing.w16,
                        _actionButton(
                          context: context,
                          text: 'bookings.accept'.tr(),
                          color: Colors.green,
                          onPressed: () {
                            context.read<BookingsBloc>().add(
                              UpdateBookingStatus(item.id, 'accepted'),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable action button used for Accept and Cancel
  Widget _actionButton({
    required BuildContext context,
    required String text,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 64,
      height: 32,
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        child: Text(
          text,
          style: AppTextStyles.interSize12(
            context,
          ).copyWith(color: color, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  // Return status color depending on booking status
  Color _statusColor(BuildContext context, String status) {
    switch (status) {
      case 'accepted':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      case 'send':
        return Colors.orange;
      default:
        return Theme.of(context).colorScheme.onSurface;
    }
  }
}
