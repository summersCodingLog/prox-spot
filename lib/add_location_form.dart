import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proxy_spot/location_item.dart';
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
  final _categoryController = TextEditingController();

  CategoryList? _category;

  void _setCategory(CategoryList? category){
    setState(() {
      _category = category;
    });
  }



  void _save(){
    if(_formKey.currentState?.validate() ?? false){
      final newLocation = LocationItem(
          name: _nameController.text,
          category: _categoryController.text
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
            DropdownButton(
              items: CategoryList.values.map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(category.name)
                  )
              ).toList(),
              value: _category,
              onChanged: _setCategory,
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