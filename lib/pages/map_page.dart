import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'edit_favorite_page.dart';

class MapPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MapPageState();

}

class _MapPageState extends State<MapPage> {

  final Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  LatLng? _currentPosition;

  @override
  void initState() {
    super.initState();
    _requestPermission();
  }

  Future<void> _requestPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _getCurrentLocation();
  }

  _getCurrentLocation() async {
    final LocationData locationResult = await location.getLocation();
    if (locationResult.latitude != null && locationResult.longitude != null) {
      setState(() {
        _currentPosition =
            LatLng(locationResult.latitude!, locationResult.longitude!);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    Set<Marker> _markers = {};
    if (_currentPosition != null) {
      _markers.add(Marker(
        markerId: MarkerId("currentLocation"),
        position: _currentPosition!,
        infoWindow: InfoWindow(title: 'current Location'),
      ));
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff154406),
        centerTitle: true,
        title: const Text('My Map', style: TextStyle(color: Colors.white, fontSize: 16),),
        leading: Text(''),
      ),
      body: _currentPosition == null
          ? const CircularProgressIndicator()
          : Column(
        children: [
          Expanded(child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _currentPosition!,
              zoom: 14.0,
            ),
            markers: _markers,
          )),
          GestureDetector(
            child: Container(
              width: double.infinity,
              height: 40,
              color: Colors.blueGrey,
              child: const Center(
                child: Text('Start edit favorite address at this location', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800),),
              ),
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) => EditFavoritePage(currentPosition: _currentPosition!,)));
            },
          ),
        ],
      ),
    );
  }

}