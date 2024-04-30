import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_location_form.dart';
import 'location_list.dart';


class FavoriteListPage extends StatelessWidget {
  const FavoriteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
            value: LocationList()
        ),
      ],
      child: const MaterialApp(
        title: 'proxy spot',
        home: const HomePage(),
      ),


    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showingForm = false;

  void _showForm(){
    setState(() {
      _showingForm = true;
    });
  }

  void _hideForm(){
    setState(() {
      _showingForm = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff154406),
        title: const Text(
            'Favorite Locations',
            style: TextStyle(color: Colors.white, fontSize: 25)
        ),
      ),
      body: Center(
          child: _showingForm
              ? AddLocationForm(hideForm: _hideForm,)
              : LocationListView()
      ),
      floatingActionButton: _showingForm
          ? null
          : FloatingActionButton(
          onPressed: _showForm,
          child: const Icon(Icons.add)),
    );
  }
}