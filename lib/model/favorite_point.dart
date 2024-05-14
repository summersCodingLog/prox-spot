
class FavoritePoint {
  final double lat;
  final double lng;
  final String name;
  final String category;
  final String address;

  FavoritePoint({required this.lat, required this.lng, required this.name, required this.category, required this.address,});

  factory FavoritePoint.fromJson(Map<String, dynamic> json) {
    return FavoritePoint(
      lat: json['lat'],
      lng: json['lng'],
      name: json['name'],
      category: json['category'],
      address: json['address'],
    );
  }

}