import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'location_item.dart';

class LocationListView extends StatelessWidget {
  LocationListView({super.key});


  @override
  Widget build(BuildContext context) {
    final locationList = context.watch<LocationList>();
    return ListView.builder(
      itemCount: locationList.num,
      itemBuilder: (context, _index) =>
          LocationItemIndex(index: _index)
    );
  }
}

class LocationList extends ChangeNotifier{
  final List<LocationItem> _locations = [];

  int get num => _locations.length;

  LocationItem operator[](int index) => _locations[index];

  void addLocation(LocationItem location){
    _locations.add(location);
    notifyListeners();
  }

  removeLocation(LocationItem location){
    _locations.remove(location);
    notifyListeners();
  }
}

enum CategoryList {
  Food, Shopping, Entertainment, None,
}









