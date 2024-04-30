import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  String? _category;

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


  @override
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
                  validator: (value){
                    if(value == null || value.trim().isEmpty){
                      return 'Address cannot be empty';
                    }
                    return null;
                  },
                ),

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
}