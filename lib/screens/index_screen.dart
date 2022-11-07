import 'package:flutter/material.dart';
import 'package:flutter_tiger_app/screens/home_screen.dart';
import 'package:flutter_tiger_app/screens/login_screen.dart';

import '../shared/spref.dart';

class IndexScreen extends StatefulWidget {
  @override
  _IndexScreenStage createState() => _IndexScreenStage();

}

class _IndexScreenStage extends State<IndexScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Image.network(
          'https://www.techsignin.com/wp-content/uploads/2018/10/microsoft-hoan-thanh-thuong-vu-github.png'),
    );
  }


  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      stick();
    });
  }

  void stick() async {
    var isLogged = await SPref.instance.get("accessToken");
    if (isLogged != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}