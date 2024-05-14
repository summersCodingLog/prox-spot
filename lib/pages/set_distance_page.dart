
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:prox_spot/main.dart';
import 'package:prox_spot/utils/hive_ext.dart';

class SetDistancePage extends StatefulWidget {
  const SetDistancePage({super.key});


  @override
  State<StatefulWidget> createState() => _SetDistancePageState();

}

class _SetDistancePageState extends State<SetDistancePage> {

  TextEditingController _controller = TextEditingController();

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
        title: const Text('set distance', style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w800),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Text('distance:', style: const TextStyle(fontSize: 14, color: Colors.black),),
                Expanded(child: TextFormField(
                  controller: _controller,
                  // decoration: const InputDecoration(
                  //     focusedBorder: InputBorder.none,
                  //     enabledBorder: InputBorder.none,
                  //     border: InputBorder.none
                  // ),

                ))
              ],
            ),
          ),
          SizedBox(height: 40,),
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
                    try {
                      double distance = double.parse(_controller.text);
                      Hive.putDistance(distance);
                      showSnackBar(context, 'distance set success!');
                    } catch (e) {
                      showSnackBar(context, 'distance set failed!');
                    }

                  }),
            ),
          ),
        ],
      ),
    );
  }

}