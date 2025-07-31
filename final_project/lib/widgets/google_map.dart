import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String label;

  final void Function(double lat, double lng)? onLocationSelected;

  const GoogleMapWidget({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.label,
    this.onLocationSelected,
  });

  @override
  Widget build(BuildContext context) {
    final LatLng position = LatLng(latitude, longitude);

    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: SizedBox(
        width: context.getWidth(factor: 0.9),
        height: context.getHeight(factor: 0.30),
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: position, zoom: 16),
          markers: {
            Marker(
              markerId: const MarkerId('service_location'),
              position: position,
              infoWindow: InfoWindow(title: label),
            ),
          },
          onTap: (LatLng selectedPosition) {
            if (onLocationSelected != null) {
              onLocationSelected!(
                selectedPosition.latitude,
                selectedPosition.longitude,
              );
            }
          },
          zoomControlsEnabled: true,
          myLocationButtonEnabled: false,
          // compassEnabled: false,
          mapType: MapType.normal,
        ),
      ),
    );
  }
}
