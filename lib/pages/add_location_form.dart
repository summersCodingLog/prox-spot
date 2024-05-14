import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'location_item.dart';
import 'location_list.dart';

class AddLocationForm extends StatefulWidget {
  final void Function() hideForm;

  const AddLocationForm({super.key, required this.hideForm});

  @override
  _AddLocationState createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocationForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();

  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: 'AIzaSyBUDrj5b0YR6RPPJ_Y3bUJGZGGpvxG61Ck');
  List<Prediction> _predictions = [];
  String? _category;

  @override
  void dispose() {
    _nameController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _searchPlaces(String input) async{
    PlacesAutocompleteResponse response = await _places.autocomplete(input);
    if (response.isOkay){
      setState(() {
        _predictions = response.predictions;
      });
    }
  }

  void _setCategory(String? category){
    setState(() {
      _category = category;
    });
  }


  void _save(){
    if(_formKey.currentState?.validate() ?? false){
      final newLocation = LocationItem(
          name: _nameController.text,
          address: _addressController.text,
          category: _category!,
      );
      context.read<LocationList>().addLocation(newLocation);
      widget.hideForm();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Location Added!')
        ),
      );
    }
  }



  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Location Name'
                  ),
                  controller: _nameController,
                  validator: (value){
                    if(value == null || value.trim().isEmpty){
                      return 'Name cannot be empty';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Address'
                  ),
                  controller: _addressController,
                  onChanged: _searchPlaces,
                  validator: (value){
                    if(value == null || value.trim().isEmpty){
                      return 'Address cannot be empty';
                    }
                    return null;
                  },
                ),


                _buildAutoSuggestion(),

                DropdownButtonFormField(
                  items: CategoryList().categories.map(
                          (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category)
                      )
                  ).toList(),
                  value: _category,
                  onChanged: _setCategory,
                  validator: (category) {
                    if(category == null) {
                      return 'Category must be selected';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Category',
                    border: OutlineInputBorder(),
                  ),
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: widget.hideForm,
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: _save,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      ),
                      child: const Text('Save'),
                    ),
                  ],
                )
              ]
          ),
        )
    );
  }


  //function displays the suggested addresses as the user types it in
  Widget _buildAutoSuggestion(){
    return _predictions.isNotEmpty
        ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _predictions.map((prediction){
        return ListTile(
            title: Text(prediction.description!),
            onTap: (){
              _addressController.text = prediction.description!;
              setState(() {
                _predictions.clear();
              });
            }
        );
      }).toList(),

    )
        : SizedBox.shrink();
  }
}
