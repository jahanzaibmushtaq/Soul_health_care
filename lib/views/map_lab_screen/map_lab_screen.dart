import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LabMapScreen extends StatefulWidget {
  const LabMapScreen({super.key});

  @override
  _LabMapScreenState createState() => _LabMapScreenState();
}

class _LabMapScreenState extends State<LabMapScreen> {
  late LatLng currentLocation = LatLng(0, 0); // Initialize with default value
  late MapController mapController;
  bool zoomToPatient = true;
  late Map<String, double> arguments = {};
  double? pharmacyLatitude;
  double? pharmacyLongitude;
  bool isCurrentLocationVisible = true;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
    mapController = MapController();
    Map<String, dynamic> arguments = Get.arguments ?? {};
    pharmacyLatitude = arguments['pharmacyLatitude'];
    pharmacyLongitude = arguments['pharmacyLongitude'];
  }
  void toggleZoomLocation() {
    setState(() {
      if (isCurrentLocationVisible) {
        mapController.move(currentLocation, 15.0);
        isCurrentLocationVisible = false;
      } else {
        mapController.move(
          LatLng(pharmacyLatitude!, pharmacyLongitude!),
          10.0,
        );
        isCurrentLocationVisible = true;
      }
    });
  }

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      // Handle the case when the user has permanently denied location permission
      print('User denied permissions to access the device\'s location');
      // Perform fallback behavior or show a message to the user
    } else if (permission == LocationPermission.denied) {
      // Handle the case when the user denied location permission
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Handle the case when the user denied location permission again
        print('User denied permissions to access the device\'s location');
        // Perform fallback behavior or show a message to the user
      } else if (permission == LocationPermission.deniedForever) {
        // Handle the case when the user has permanently denied location permission after requesting it
        print('User denied permissions to access the device\'s location');
        // Perform fallback behavior or show a message to the user
      } else {
        // User granted location permission
        try {
          Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );
          setState(() {
            currentLocation = LatLng(position.latitude, position.longitude);
          });
        } catch (e) {
          // Handle the error when unable to get current location
          print('Error getting current location: $e');
          // Perform fallback behavior or show an error message to the user
        }
      }
    } else {
      // User already granted location permission
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        setState(() {
          currentLocation = LatLng(position.latitude, position.longitude);
        });
      } catch (e) {
        // Handle the error when unable to get current location
        print('Error getting current location: $e');
        // Perform fallback behavior or show an error message to the user
      }
    }
  }

  Future<String> getAddressFromCoordinates(double latitude, double longitude) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemarks[0];
    return "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
  }



  @override
  Widget build(BuildContext context) {
    final arguments = Get.arguments as Map<String, double>;
    final double pharmacyLatitude = arguments['pharmacyLatitude']!;
    final double pharmacyLongitude = arguments['pharmacyLongitude']!;

    LatLngBounds bounds = LatLngBounds.fromPoints([
      LatLng(currentLocation.latitude, currentLocation.longitude),
      LatLng(pharmacyLatitude, pharmacyLongitude),
    ]);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      mapController.fitBounds(
        bounds,
        options: const FitBoundsOptions(
          padding: EdgeInsets.all(50.0), // Adjust the padding value as needed
          maxZoom: 15.0,
        ),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
              mapController: mapController,
              options: MapOptions(
                zoom: 12.0,
                interactiveFlags: InteractiveFlag.pinchZoom |
                InteractiveFlag.drag |
                InteractiveFlag.doubleTapZoom,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: const ['a', 'b', 'c'],
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      width: 40.0,
                      height: 40.0,
                      point: currentLocation,
                      builder: (ctx) => const Icon(
                        Icons.location_pin,
                        color: Colors.blue,
                      ),
                    ),
                    Marker(
                      width: 40.0,
                      height: 40.0,
                      point: LatLng(pharmacyLatitude, pharmacyLongitude),
                      builder: (ctx) => const Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: [
                        LatLng(currentLocation.latitude, currentLocation.longitude),
                        LatLng(pharmacyLatitude, pharmacyLongitude),
                      ],
                      color: Colors.blue,
                      strokeWidth: 3.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Current Location:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8.0),
                FutureBuilder<String>(
                  future: getAddressFromCoordinates(currentLocation.latitude, currentLocation.longitude),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!,
                        style: const TextStyle(fontSize: 18),
                      );
                    } else if (snapshot.hasError) {
                      return const Text(
                        'Error retrieving address',
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Doctor Location:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8.0),
                FutureBuilder<String>(
                  future: getAddressFromCoordinates(pharmacyLatitude, pharmacyLongitude),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                        snapshot.data!,
                        style: const TextStyle(fontSize: 18),
                      );
                    } else if (snapshot.hasError) {
                      return const Text(
                        'Error retrieving address',
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:  toggleZoomLocation,
        child: const Icon(Icons.my_location),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

    );
  }
}
