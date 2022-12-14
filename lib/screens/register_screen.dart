import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tiger_app/network/auth_api.dart';
import 'package:flutter_tiger_app/screens/login_screen.dart';
import 'package:flutter_tiger_app/screens/otp_screen.dart';

import '../utilities/constants.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState()  => _RegisterScreenState();

}

class _RegisterScreenState extends State<RegisterScreen> {

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF73AEF5),
                        Color(0xFF61A4F1),
                        Color(0xFF478DE0),
                        Color(0xFF398AE5),
                      ],
                      stops: [0.1, 0.4, 0.7, 0.9],
                    )),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Đăng ký',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      _buildEmailTF(),
                      const SizedBox(
                        height: 30.0,
                      ),
                      _buildRegisterBtn(),
                      _buildLoginBtn()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white, fontFamily: 'OpenSans'),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Enter your Email',
                hintStyle: khintTextStyle),
          ),
        )
      ],
    );
  }

  Widget _buildRegisterBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: doRegister,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: const Text(
          'Register',
          style: TextStyle(
              color: Color(0xFF527DAA),
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans'),
        ),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return GestureDetector(
      onTap: doLogin,
      child: RichText(
        text: const TextSpan(children: [
          TextSpan(
            text: 'Đăng nhập',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }

  doRegister() {
    // validate email
    var email = _emailController.text;

    // call api register
    AuthApi().register(email).then((value) => {
      if (value == 1) {
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OtpScreen(email)))
      } else {
        // show lỗi
      }
    });
  }

  doLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
