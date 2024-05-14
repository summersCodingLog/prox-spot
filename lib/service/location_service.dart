import 'dart:async';
import 'dart:math';

import 'package:hive_flutter/adapters.dart';
import 'package:location/location.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:prox_spot/utils/hive_ext.dart';

import '../model/favorite_point.dart';

class LocationService {
  final Location location = Location();
  Timer? timer;
  LocationService();

  void initialize() async {

    // init notifications
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);


    timer = Timer.periodic(Duration(seconds: 5), (Timer t) async {
      if (await checkPermission()) {
        var locationData = await location.getLocation();
        checkDistanceAndNotify(locationData, flutterLocalNotificationsPlugin);
      }

    });

    // Start positioning and check the distance
    // location.onLocationChanged.listen((LocationData currentLocation) {
    //   checkDistanceAndNotify(currentLocation, flutterLocalNotificationsPlugin);
    // });

  }

  Future<bool> checkPermission() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  void checkDistanceAndNotify(LocationData currentLocation, FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    for (FavoritePoint point in Hive.getFavoritePoints()) {
      double distanceInMeters = calculateDistance(currentLocation.latitude, currentLocation.longitude, point.lat, point.lng);
      if (distanceInMeters <= Hive.getDistance()) {
        // send
        var androidPlatformChannelSpecifics = AndroidNotificationDetails(
            'spot channel id', 'prox_spot', 'distance notification',
            importance: Importance.max, priority: Priority.high, ticker: 'ticker');
        var platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);
        await flutterLocalNotificationsPlugin.show(
            0, 'Approaching spot', 'Your distance from ${point.name} is less than ${Hive.getDistance()} meters', platformChannelSpecifics);
      }
    }
  }

  // A function used to calculate the distance between two points
  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a)) * 1000; // Returns results in meters
  }
}