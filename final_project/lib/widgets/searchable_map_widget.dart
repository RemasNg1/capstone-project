import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';

class SearchableGoogleMapWidget extends StatefulWidget {
  final LatLng initialPosition;
  final Function(LatLng)? onLocationSelected;
  final String label;

  const SearchableGoogleMapWidget({
    super.key,
    required this.initialPosition,
    this.onLocationSelected,
    required this.label,
  });

  @override
  State<SearchableGoogleMapWidget> createState() =>
      _SearchableGoogleMapWidgetState();
}

class _SearchableGoogleMapWidgetState extends State<SearchableGoogleMapWidget> {
  final TextEditingController _searchController = TextEditingController();
  List<dynamic> _placePredictions = [];
  LatLng? _selectedLocation;
  String? _selectedAddress;
  late GoogleMapController _mapController;

  String get _apiKey => Platform.isAndroid
      ? dotenv.env['API_KEY_ANDROID']!
      : dotenv.env['API_KEY_IOS']!;
  @override
  void initState() {
    _selectedLocation = widget.initialPosition;
    super.initState();
  }

  Future<void> _setMapStyle(BuildContext context) async {
    final style = Theme.of(context).brightness == Brightness.dark
        ? await rootBundle.loadString('assets/map/map_style.json')
        : null;

    if (style != null) {
      _mapController.setMapStyle(style);
    }
  }

  void _getAddressFromLatLng(double lat, double lng) async {
    print("📍 Getting address for: ($lat, $lng)");
    try {
      final placemarks = await placemarkFromCoordinates(lat, lng);
      if (!mounted) return;

      if (placemarks.isNotEmpty) {
        final p = placemarks.first;
        final address =
            "${p.name}, ${p.locality}, ${p.administrativeArea}, ${p.country}";
        print(" Address found: $address");

        setState(() {
          _selectedAddress = address;
        });
      }
    } catch (e) {
      print(" Failed to get address: $e");
      if (!mounted) return;
      setState(() => _selectedAddress = "Unknown location");
    }
  }

  Future<void> _selectPlace(String placeId) async {
    print(" Selecting place with ID: $placeId");

    final url = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$_apiKey',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['status'] != 'OK') return;

      final location = data['result']['geometry']['location'];
      final latLng = LatLng(location['lat'], location['lng']);
      print(" Selected location: $latLng");

      _mapController.animateCamera(CameraUpdate.newLatLngZoom(latLng, 16));

      if (!mounted) return;

      setState(() {
        _selectedLocation = latLng;
        _searchController.clear();
        _placePredictions.clear();
      });

      _getAddressFromLatLng(latLng.latitude, latLng.longitude);
      widget.onLocationSelected?.call(latLng);
    } else {
      print(" Failed to get place details.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _selectedLocation!,
              zoom: 14,
            ),
            onMapCreated: (controller) {
              _mapController = controller;
              _setMapStyle(context);
            },
            markers: _selectedLocation != null
                ? {
                    Marker(
                      markerId: const MarkerId("selected"),
                      position: _selectedLocation!,
                      infoWindow: InfoWindow(title: widget.label),
                    ),
                  }
                : {},
            onTap: (LatLng pos) {
              setState(() => _selectedLocation = pos);
              _getAddressFromLatLng(pos.latitude, pos.longitude);
              widget.onLocationSelected?.call(pos);
            },
            myLocationButtonEnabled: false,
            zoomControlsEnabled: true,
          ),

          // Search Field
          Positioned(
            top: 12,
            left: 12,
            right: 12,
            child: Column(
              children: [
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(8),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            hintText: "ابحث عن الموقع...",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(14),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () async {
                          final value = _searchController.text.trim();
                          print("🔍 Search pressed. Input: $value");

                          if (value.isNotEmpty) {
                            final url = Uri.parse(
                              'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$value&key=$_apiKey&language=ar&components=country:sa',
                            );
                            print(" Sending request to: $url");

                            final res = await http.get(url);
                            print(" Status code: ${res.statusCode}");
                            print(" Response body: ${res.body}");

                            if (res.statusCode == 200) {
                              final data = json.decode(res.body);
                              setState(
                                () => _placePredictions = data['predictions'],
                              );
                              print(
                                " Found ${_placePredictions.length} predictions",
                              );
                            } else {
                              print(" Error fetching autocomplete results.");
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),

                if (_placePredictions.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView.builder(
                      itemCount: _placePredictions.length,
                      itemBuilder: (context, index) {
                        final p = _placePredictions[index];
                        return ListTile(
                          title: Text(p['description']),
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            _selectPlace(p['place_id']);
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),

          // Location label
          if (_selectedAddress != null)
            Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _selectedAddress!,
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
