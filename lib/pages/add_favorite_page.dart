
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:prox_spot/main.dart';
import 'package:prox_spot/pages/home_page.dart';
import 'package:prox_spot/utils/hive_ext.dart';

import '../model/favorite_point.dart';

List<String> categories = ["restaurant",'entertainment', 'drink', 'sport', 'outdoor', 'other'];

class AddFavoritePage extends StatefulWidget {

  final LatLng currentPosition;
  final String addr;

  const AddFavoritePage({super.key, required this.currentPosition, required this.addr});

  @override
  State<StatefulWidget> createState() => _AddFavoritePageState();

}

class _AddFavoritePageState extends State<AddFavoritePage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String _category = 'restaurant';

  @override
  void initState() {
    super.initState();
    _addressController.text = widget.addr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Center(
          child: GestureDetector(
            child: const Icon(Icons.arrow_back, size: 30, color: Colors.black,),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text('Edit favorite address', style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w800),),
      ),
      body: Column(
        children: [
          _buildLabel('point:', '${widget.currentPosition.latitude}, ${widget.currentPosition.longitude}', null),
          const Divider(color: Colors.black, indent: 20, endIndent: 20,),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DropdownButtonFormField(
              value: _category,
              items: categories
                  .map((label) => DropdownMenuItem(
                value: label,
                child: Text(label),
              ))
                  .toList(),
              decoration: const InputDecoration(labelText: 'category'),
              onChanged: (newValue) {
                setState(() {
                  _category = '$newValue';
                });
              },
            ),
          ),
          _buildLabel('name:', null, _nameController),
          const Divider(color: Colors.black, indent: 20, endIndent: 20,),
          _buildLabel('address:', null, _addressController),
          const Divider(color: Colors.black, indent: 20, endIndent: 20,),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: MaterialButton(
                  color: const Color(0xff154406),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),

                  ),
                  child: const Text('SAVE', style: TextStyle(color: Colors.white),),
                  onPressed: () async {
                    String name = _nameController.text;
                    String address = _addressController.text;
                    if (name == '' || address == '') {
                      showSnackBar(context, 'name/address not empty!');
                      return;
                    }
                    FavoritePoint? favoritePoint = Hive.getFavoritePoint(widget.currentPosition.latitude, widget.currentPosition.longitude);
                    if (favoritePoint != null) {
                      showSnackBar(context, 'this address already exists');
                      return;
                    }
                    favoritePoint = FavoritePoint(lat: widget.currentPosition.latitude, lng: widget.currentPosition.longitude, name: name, category: _category, address: address);
                    await Hive.putFavoritePoint(favoritePoint);
                    showSnackBar(context, 'save success!');
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) => Center(
                      child: HomePage(),
                    )), (r) => false);
                  }),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  _buildLabel (String title, String? content, TextEditingController? controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(title, style: const TextStyle(fontSize: 14, color: Colors.black),),
          Expanded(child: content == null? TextFormField(
            controller: controller,
            decoration: const InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none
            ),

          ): Text(content, style: const TextStyle(fontSize: 14, color: Colors.black),),)
        ],
      ),
    );
  }

}