import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String label;

  const GoogleMapWidget({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final LatLng position = LatLng(latitude, longitude);

    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: SizedBox(
        width: 343,
        height: 197,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: position, zoom: 16),
          markers: {
            Marker(
              markerId: const MarkerId('service_location'),
              position: position,
              infoWindow: InfoWindow(title: label),
            ),
          },
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          compassEnabled: false,
          mapType: MapType.normal,
        ),
      ),
    );
  }
}
