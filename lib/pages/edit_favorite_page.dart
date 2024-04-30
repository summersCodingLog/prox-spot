
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EditFavoritePage extends StatefulWidget {

  final LatLng currentPosition;

  const EditFavoritePage({super.key, required this.currentPosition});

  @override
  State<StatefulWidget> createState() => _EditFavoritePageState();

}

class _EditFavoritePageState extends State<EditFavoritePage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();


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
          _buildLabel('Favorite Location:', 'latitude:${widget.currentPosition.latitude}, longitude:${widget.currentPosition.longitude}', null),
          const Divider(color: Colors.black, indent: 20, endIndent: 20,),
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