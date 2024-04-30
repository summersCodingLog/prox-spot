import 'package:flutter/material.dart';
import 'package:prox_spot/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Google Login Demo'),
        //   backgroundColor: Colors.redAccent,
        // ),
        body: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.black87,
              Colors.black54,
            ],
          ),
        ),
          child: Center(
            child: GoogleLoginButton(),
          ),
        ),
      ),
    );
  }
}

class GoogleLoginButton extends StatelessWidget {
  void _onPressed(BuildContext context) {
    // Placeholder for login logic
    print('Google login button pressed');
    Navigator.push(context, MaterialPageRoute(builder: (ctx) => HomePage()));

  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        _onPressed(context);
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        side: BorderSide(color: Colors.redAccent),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      icon: Icon(Icons.login, size: 24),
      label: Text('Sign in with Google', style: TextStyle(fontSize: 16)),
    );
  }
}