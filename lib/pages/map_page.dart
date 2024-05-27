import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart' as geo;
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
  String? _tapMarkerAddr;

  @override
  void initState() {
    super.initState();
    _requestPermission();
    _getClipboardData().then((clipboardContent) async {
      if (_tapMarkerAddr != null && _tapMarkerAddr!.isNotEmpty && _tapMarkerAddr == clipboardContent) {
        return;
      }
      showSnackBar(context, "Paste-on：$clipboardContent");
      if (clipboardContent != null && clipboardContent.isNotEmpty) {
        geo.Location? location = await _checkAddress(clipboardContent);
        showSnackBar(context, "checkAddress：${location?.toString()??''}");
        if (location != null) {
          _tapMarkerAddr = clipboardContent;
          LatLng tapLatLng = LatLng(location.latitude, location.longitude);
          _handleTap(tapLatLng);
          _controller.future.then((value)  {
            value.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(target: tapLatLng, zoom: 14),
              ),
            );
          });
        }
      }

    });

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

  Future<geo.Location?> _checkAddress(String address) async {
    try {
      List<geo.Location> locations = await geo.locationFromAddress(address);
      if (locations == null || locations.isEmpty) {
        print('Invalid address!');
      } else {
        geo.Location location = locations.first;
        print('checkAddress: ${location.latitude}, ${location.longitude}');
        return location;
      }
    } on Exception catch (e) {
      print('Error occurred, invalid or not recognized address');
    }
    return null;
  }

  Future<String?> _getClipboardData() async {
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    String? clipboardContent = data?.text;
    print('The contents of the clipboard are:：${clipboardContent??''}');
    return clipboardContent;
  }

  _addFavoriteMarkers() {
    List<FavoritePoint> favoritePoints = Hive.getFavoritePoints();
    for (int i = 0; i < favoritePoints.length; i++) {
      LatLng point = LatLng(favoritePoints[i].lat, favoritePoints[i].lng);
      _markers.add(Marker(
        markerId: MarkerId(point.toString()),
        position: point,
        infoWindow: InfoWindow(
          title: favoritePoints[i].name,
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
          : Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            mapType: MapType.hybrid,
            initialCameraPosition: CameraPosition(
              target: _currentPosition!,
              zoom: 14.0,
            ),
            markers: _markers,
            // onTap: _handleTap,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Positioned(
              bottom: 20,
              left: 40,
              right: 40,
              child: MaterialButton(
                color: const Color(0xff154406),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),

                ),
                onPressed: () {
                  if (_tapMarker == null || _tapMarkerAddr == null || _tapMarkerAddr!.isEmpty) {
                    showSnackBar(context, 'point null!');
                    return;
                  }
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) => AddFavoritePage(currentPosition: _tapMarker!.position, addr: _tapMarkerAddr!,)));
                },
                child: Text('Add a favorite location', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800),),
              ))
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
      infoWindow: InfoWindow(
        title: _tapMarkerAddr!,
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(50),
    );
    _markers.add(_tapMarker!);
    setState(() {
    });
  }

}