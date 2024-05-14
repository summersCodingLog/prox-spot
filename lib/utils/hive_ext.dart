import 'package:hive_flutter/hive_flutter.dart';

import '../adapter/favorite_point_adapter.dart';
import '../model/favorite_point.dart';


extension AppHiveInst on HiveInterface {
  static String _boxName = "prox_spot";

  initUserHive(String boxName) async {
    _boxName = boxName;
    Hive.registerAdapter(FavoritePointAdapter());
    // await Hive.initFlutter();
    await Hive.openBox(_boxName);
  }

  Future<void> putLoginEmail(String loginEmail) async {
    await Hive.openBox('app_login');
    return await Hive.box('app_login').put('loginEmail', loginEmail);
  }

  Future<String> getLoginEmail() async {
    await Hive.initFlutter();
    await Hive.openBox('app_login');
    return Hive.box('app_login').get('loginEmail', defaultValue: '');
  }


  Future<void> putFavoritePoint(FavoritePoint favoritePoint) async {
    List<FavoritePoint> favoritePoints = getFavoritePoints();
    favoritePoints.add(favoritePoint);
    return await Hive.box(_boxName).put('favoritePoints', favoritePoints);
  }

  List<FavoritePoint> getFavoritePoints() {
    List<FavoritePoint> favoritePoints = Hive.box(_boxName).get('favoritePoints', defaultValue: <FavoritePoint>[]).cast<FavoritePoint>();
    return favoritePoints;
  }

  FavoritePoint? getFavoritePoint(double lat, double lng) {
    List<FavoritePoint> favoritePoints = Hive.box(_boxName).get('favoritePoints', defaultValue: <FavoritePoint>[]).cast<FavoritePoint>();
    for(int i = 0; i < favoritePoints.length; i++) {
      FavoritePoint favoritePoint = favoritePoints[i];
      if (favoritePoint.lat == lat && favoritePoint.lng == lng) {
        return favoritePoint;
      }
    }
    return null;
  }

  Future<void> updateFavoritePoint(FavoritePoint newFavoritePoint) async {
    List<FavoritePoint> favoritePoints = getFavoritePoints();
    int index = -1;
    for(int i = 0; i < favoritePoints.length; i++) {
      FavoritePoint favoritePoint = favoritePoints[i];
      if (favoritePoint.lat == newFavoritePoint.lat && favoritePoint.lng == newFavoritePoint.lng) {
        index = i;
        break;
      }
    }
    if (index != -1) {
      favoritePoints.removeAt(index);
      favoritePoints.insert(index, newFavoritePoint);
      await Hive.box(_boxName).put('favoritePoints', favoritePoints);
    }
  }

  Future<void> deleteFavoritePoint(FavoritePoint favoritePoint) async {
    List<FavoritePoint> favoritePoints = getFavoritePoints();
    favoritePoints.remove(favoritePoint);
    await Hive.box(_boxName).put('favoritePoints', favoritePoints);
  }

  Future<void> putDistance(double distance) async {
    return await Hive.box(_boxName).put('distance', distance);
  }

  double getDistance() {
    double distance = Hive.box(_boxName).get('distance', defaultValue: 100);
    return distance;
  }

}
