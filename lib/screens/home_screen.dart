import 'package:flutter/material.dart';
import 'package:flutter_tiger_app/screens/login_screen.dart';

import '../shared/spref.dart';
import '../utilities/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Tiger app',
            style: TextStyle(color: Colors.white),
          ),
      ),
      body: Center(
        child: RaisedButton(
          elevation: 5.0,
          onPressed: doLogout,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.white,
          child: const Text(
            'Đăng xuất',
            style: TextStyle(
                color: Color(0xFF527DAA),
                letterSpacing: 1.5,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans'),
          ),
        ),
      ),
    );
  }


  void doLogout() async {
    await SPref.instance.set("accessToken", '');
    await SPref.instance.set("refreshToken", '');
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}