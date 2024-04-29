import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_location_form.dart';
import 'location_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: LocationList()
          ),
        ],
      child: const MaterialApp(
        title: 'proxyspot',
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Proxy Spot"),
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



