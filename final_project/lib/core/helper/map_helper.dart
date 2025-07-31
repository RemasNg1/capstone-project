import 'package:url_launcher/url_launcher.dart';

openInGoogleMaps(double lat, double lng) async {
  final googleMapsUrl = Uri.parse(
    "https://www.google.com/maps/search/?api=1&query=$lat,$lng",
  );

  if (await canLaunchUrl(googleMapsUrl)) {
    await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not open Google Maps.';
  }
}
