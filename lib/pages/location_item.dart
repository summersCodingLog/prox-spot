import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'location_list.dart';

class LocationItem{
  final String name;
  final String address;
  final String category;

  LocationItem({
    required this.name,
    required this.address,
    required this.category,
  });
}

class CategoryList {
  final List<String> categories = ["Shopping", "Food", "Dessert", "Entertainment", "No Category"];

  CategoryList();

  void add(String new_category){
    categories.add(new_category);
  }

  void delete(String category){

    categories.removeAt(0);
  }
  //CategoryList(this.categories);
}

class LocationItemIndex extends StatelessWidget {
  final int index;
  const LocationItemIndex({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final location = context.read<LocationList>()[index];
    return Card(
        child: ListTile(
          leading: SizedBox(width: 5),
            title: Text(location.name),
            subtitle: Text(location.address),
            trailing: PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'edit',
                  child: ListTile(
                    leading: Icon(Icons.edit),
                    title: Text(location.category),
                  ),
                ),
                const PopupMenuItem<String>(
                  value: 'delete',
                  child: ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Delete'),
                  ),
                ),
              ],
                onSelected: (String choice) {
                  if (choice == 'edit') {
                    //empty for now

                  } else if (choice == 'delete') {
                    context.read<LocationList>().removeLocation(location);
                  }
              }
            )
        )
    );
  }


}
