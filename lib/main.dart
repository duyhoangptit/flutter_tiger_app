import 'package:flutter/material.dart';
import 'package:flutter_tiger_app/screens/index_screen.dart';
import 'package:flutter_tiger_app/screens/login_screen.dart';
import 'package:flutter_tiger_app/screens/otp_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tiger App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IndexScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

