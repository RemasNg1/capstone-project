import 'package:final_project/core/helper/map_helper.dart';
import 'package:final_project/utils/extensions/screen/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  //
  Future<void> _setMapStyle(
    BuildContext context,
    GoogleMapController controller,
  ) async {
    if (Theme.of(context).brightness == Brightness.dark) {
      final style = await rootBundle.loadString('assets/map/map_style.json');
      controller.setMapStyle(style);
    } else {
      controller.setMapStyle(null);
    }
  }

  //
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
          //
          onMapCreated: (controller) {
            _setMapStyle(context, controller);
          },
          //
          onTap: (LatLng selectedPosition) {
            openInGoogleMaps(latitude, longitude);
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
