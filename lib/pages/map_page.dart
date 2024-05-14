import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:location/location.dart';
import 'package:prox_spot/main.dart';
import 'package:prox_spot/utils/hive_ext.dart';

import '../model/favorite_point.dart';
import 'add_favorite_page.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});


  @override
  State<StatefulWidget> createState() => _MapPageState();

}

class _MapPageState extends State<MapPage> {

  final Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  LatLng? _currentPosition;
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  Marker? _tapMarker;

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
      _currentPosition =
          LatLng(locationResult.latitude!, locationResult.longitude!);
      _markers.add(Marker(
        markerId: const MarkerId("currentLocation"),
        position: _currentPosition!,
        infoWindow: const InfoWindow(title: 'current Location'),
      ));
      setState(() {
      });
      _addFavoriteMarkers();
    }

  }

  _addFavoriteMarkers() {
    List<FavoritePoint> favoritePoints = Hive.getFavoritePoints();
    for (int i = 0; i < favoritePoints.length; i++) {
      LatLng point = LatLng(favoritePoints[i].lat, favoritePoints[i].lng);
      _markers.add(Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        infoWindow: const InfoWindow(
          title: 'favorite point',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(80),
      ));
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff154406),
        centerTitle: true,
        title: const Text('My Map', style: TextStyle(color: Colors.white, fontSize: 16),),
        leading: Text(''),
      ),
      body: _currentPosition == null
          ? const Center(child: CircularProgressIndicator(),)
          : Column(
        children: [
          Expanded(child: GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            mapType: MapType.hybrid,
            initialCameraPosition: CameraPosition(
              target: _currentPosition!,
              zoom: 14.0,
            ),
            markers: _markers,
            onTap: _handleTap,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
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
              if (_tapMarker == null) {
                showSnackBar(context, 'point null!');
                return;
              }
              Navigator.push(context, MaterialPageRoute(builder: (ctx) => AddFavoritePage(currentPosition: _tapMarker!.position,)));
            },
          ),
        ],
      ),
    );
  }

  _handleTap(LatLng point) {
    print(point);
    if (_tapMarker != null) {
      _markers.remove(_tapMarker);
    }
    _tapMarker = Marker(
      markerId: MarkerId(point.toString()),
      position: point,
      infoWindow: const InfoWindow(
        title: 'select point',
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(50),
    );
    _markers.add(_tapMarker!);
    setState(() {
    });
  }

}