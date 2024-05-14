import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:prox_spot/pages/home_page.dart';
import 'package:prox_spot/utils/hive_ext.dart';

String loginEmail = '';
Future<void> main() async {
  loginEmail = await Hive.getLoginEmail();
  bool isLogin = loginEmail != '';
  if (isLogin) {
    await Hive.initUserHive(loginEmail);
  }
  runApp(MyApp(toHome: isLogin,));
}

class MyApp extends StatelessWidget {
  final bool toHome;
  const MyApp({super.key, required this.toHome});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.black87,
              Colors.black54,
            ],
          ),
        ),
          child: toHome ? const HomePage(): Center(
            child: GoogleLoginButton(),
          ),
        ),
      ),
    );
  }
}

class GoogleLoginButton extends StatelessWidget {

  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  GoogleLoginButton({super.key});

  Future<void> _onPressed(BuildContext context) async {
    try {
      final result = await googleSignIn.signIn();
      if (result != null) {
        print('SignIn successful!');
        loginEmail = result.email;
        print('Email: $loginEmail');
        await Hive.putLoginEmail(loginEmail);
        await Hive.initUserHive(loginEmail);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) => const HomePage()), (r) => false);
      }
    } catch (error) {
      print('SignIn failed: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        _onPressed(context);
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.redAccent,
        side: const BorderSide(color: Colors.redAccent),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      icon: const Icon(Icons.login, size: 24),
      label: const Text('Sign in with Google', style: TextStyle(fontSize: 16)),
    );
  }
}

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: const Duration(seconds: 2),
    action: SnackBarAction(
      label: '',
      onPressed: () {
      },
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}