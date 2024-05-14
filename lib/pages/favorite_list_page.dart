import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prox_spot/pages/edit_favorite_page.dart';
import 'package:prox_spot/utils/hive_ext.dart';

import '../main.dart';
import '../model/favorite_point.dart';
import 'set_distance_page.dart';

class FavoriteListPage extends StatefulWidget {
  const FavoriteListPage({super.key});


  @override
  State<StatefulWidget> createState() => _FavoriteListPageState();

}

class _FavoriteListPageState extends State<FavoriteListPage> {

  List<FavoritePoint> favoritePoints = Hive.getFavoritePoints(); // 你的列表获取方法
  List<FavoritePoint> displayedPoints = [];
  List<String> categories = ["restaurant", "entertainment", "drink", "sport", "outdoor", "other"];
  String filter = '';
  String selectedCategory = 'all'; // 初始筛选类别
  final TextEditingController _searchController = TextEditingController();


  @override
  void initState() {
    super.initState();
    displayedPoints = favoritePoints;
  }

  void searchPoints(String query) {
    final String lowerCaseQuery = query.toLowerCase();
    List<FavoritePoint> filteredPoints = favoritePoints.where(
          (point) {
        return (point.name.toLowerCase().contains(lowerCaseQuery) || point.address.toLowerCase().contains(lowerCaseQuery)) && (selectedCategory == 'all' || point.category == selectedCategory);
      },
    ).toList();

    setState(() {
      displayedPoints = filteredPoints;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff154406),
        centerTitle: true,
        title: const Text('Favorite Address', style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w800),),
        leading: const Text(''),
        actions: [
          GestureDetector(
            child: Center(
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text('distance', style: TextStyle(color: Colors.black),),),
            ),
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (ctx) => SetDistancePage()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          GestureDetector(
            child: Container(
              width: double.infinity,
              height: 40,
              color: Colors.blueGrey,
              child: Center(
                child: Text('login email: $loginEmail', style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w800),),
              ),
            ),
            onTap: () {
              _showLogoutDialog();
            },
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                DropdownButton<String>(
                  value: selectedCategory,
                  items: [
                    DropdownMenuItem(
                      child: Text('All'),
                      value: 'all',
                    ),
                    ...categories.map((String category) {
                      return DropdownMenuItem(
                        child: Text(category),
                        value: category,
                      );
                    }).toList(),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      selectedCategory = value;
                      searchPoints(_searchController.text);
                      setState(() {

                      });
                      // onSearchChanged(value);
                    }
                  },
                ),
                Expanded(child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Search',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        searchPoints(_searchController.text);
                      },
                    ),
                  ),
                ),)
              ],
            ),

          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayedPoints.length,
              itemBuilder: (context, index) {
                final point = displayedPoints[index];
                return ListTile(
                  title: Text('${point.name} (${point.category})'),
                  subtitle: Text('${point.address} - ${point.lat}, ${point.lng}'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (ctx)=> EditFavoritePage(favoritePoint: point)));
                  },
                );
              },
            ),
          ),

        ],
      ),
    );
  }

  _showLogoutDialog() {
    showDialog(context: context, builder: (ctx) {
      return AlertDialog(
        title: Text('Log out'),
        content: Text('Are you sure you are logging out?'),
        actions: [
          GestureDetector(
            child: Text('cancel'),
            onTap: () {
              Navigator.pop(ctx);
            },
          ),
          GestureDetector(
            child: Text('sure'),
            onTap: () async {
              try {
                final result = await GoogleSignIn().signOut();
                loginEmail = '';
                print('SignOut successful!');
                await Hive.putLoginEmail('');
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) => Center(
                  child: GoogleLoginButton(),
                )), (r) => false);
              } catch (error) {
                print('SignIn failed: $error');
              }


            },
          ),
        ],
      );
    });
  }
}