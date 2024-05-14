import 'package:hive/hive.dart';

import '../model/favorite_point.dart';

class FavoritePointAdapter extends TypeAdapter<FavoritePoint> {


  @override
  int get typeId => 101;

  @override
  FavoritePoint read(BinaryReader reader) {
    var lat = reader.readDouble();
    var lng = reader.readDouble();
    var name = reader.readString();
    var category = reader.readString();
    var address = reader.readString();
    return FavoritePoint(lat: lat, lng: lng, name: name, category: category, address: address);
  }


  @override
  void write(BinaryWriter writer, FavoritePoint obj) {
    writer.writeDouble(obj.lat);
    writer.writeDouble(obj.lng);
    writer.writeString(obj.name);
    writer.writeString(obj.category);
    writer.writeString(obj.address);
  }

}