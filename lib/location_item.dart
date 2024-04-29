import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'location_list.dart';

class LocationItem{
  final String name;
  final String category;

  LocationItem({
    required this.name,
    required this.category,
  });
}

class LocationItemIndex extends StatelessWidget {
  final int index;
  const LocationItemIndex({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final location = context.read<LocationList>()[index];
    return Card(
      child: ListTile(
        title: Text(location.name),
        subtitle: Text(location.category),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: (){
            context.read<LocationList>().removeLocation(location);
          },
        )
      )
    );
  }


}