import 'package:flutter/material.dart';
import 'package:flutter_tiger_app/network/auth_api.dart';
import 'package:flutter_tiger_app/shared/input/otp_input.dart';

import '../shared/spref.dart';
import 'home_screen.dart';

class OtpScreen extends StatefulWidget {
  final String email;
  const OtpScreen(this.email, {Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();

}

class _OtpScreenState extends State<OtpScreen> {

  final TextEditingController _filedOne = TextEditingController();
  final TextEditingController _filedTwo = TextEditingController();
  final TextEditingController _filedThree = TextEditingController();
  final TextEditingController _filedFour = TextEditingController();
  final TextEditingController _filedFive = TextEditingController();

  String? _otp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Xác nhận OTP'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Nhập mã xác mình OTP gửi về email của bạn'),
          const SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OtpInput(_filedOne, true),
              OtpInput(_filedTwo, false),
              OtpInput(_filedThree, false),
              OtpInput(_filedFour, false),
              OtpInput(_filedFive, false),
            ],
          ),
          const SizedBox(height: 30,),
          ElevatedButton(
              onPressed: doVerifyOtp,
              child: const Text('Đăng ký'),
          ),
          const SizedBox(height: 30,),
          Text(
            _otp ?? 'Please enter OTP',
            style: const TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }


  void doVerifyOtp() {
    _otp = _filedOne.text
        + _filedTwo.text
        + _filedThree.text
        + _filedFour.text
        + _filedFive.text;

    AuthApi().verifyOtp(widget.email, _otp!).then((user) async {
      print(user);
      await SPref.instance.set("accessToken", user.accessToken);
      await SPref.instance.set("refreshToken", user.refreshToken);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen())
      );
    });
  }
}