import 'package:flutter/material.dart';
import 'package:movecoin/screen/item.dart';
import 'package:movecoin/screen/home.dart';
import 'package:movecoin/screen/login.dart';
import 'package:movecoin/screen/signup.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
