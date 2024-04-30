import 'package:flutter/material.dart';

class FavoriteListPage extends StatefulWidget {
  const FavoriteListPage({super.key});


  @override
  State<StatefulWidget> createState() => _FavoriteListPageState();

}

class _FavoriteListPageState extends State<FavoriteListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff154406),
        centerTitle: true,
        title: const Text('Favorite Address', style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w800),),
        leading: Text(''),
      ),
      body: ListView(
        children: [
          ...<Map<String, dynamic>>[{
            "name":"abc",
            "latitude":'0.000',
            "longitude":'0.000',
            "address":"11011 NE 9th St B, Bellevue, WA 98004",
          }].map((e) {
            return GestureDetector(
              child: Column(
                children: [
                  _buildLabel('name:', '${e['name']}'),
                  _buildLabel('Latitude:', 'latitude:${e['latitude']}'),
                  _buildLabel('Longitude:', 'longitude:${e['longitude']}'),
                  _buildLabel('address:', '${e['address']}'),
                  const Divider(color: Colors.black, indent: 20, endIndent: 20,),
                ],
              ),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (ctx) => ItemDetailPage(data: e,)));
              },
            );
          }).toList()
        ],
      ),
    );
  }

  _buildLabel (String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(title, style: const TextStyle(fontSize: 14, color: Colors.black),),
          Text(content, style: const TextStyle(fontSize: 14, color: Colors.black),)
        ],
      ),
    );
  }

}