import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myiproject/Controllers/Common/SplashScreenController.dart';
import 'package:myiproject/Models/Colors.dart';
import 'package:myiproject/Models/Strings.dart';
import 'package:myiproject/Models/Utils.dart';
import 'package:myiproject/Views/Auth/Login.dart';
import 'package:myiproject/Views/Home/Home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startApp();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Utils.displaySize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: Utils.getGradientBackground(),
        child: Stack(
          children: [
            SizedBox(
              width: Utils.displaySize.width,
              height: Utils.displaySize.height,
              child: Image.asset(
                'assets/img/start.png',
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    UtilStrings.appTitle,
                    style: GoogleFonts.openSans(
                        color: UtilColors.whiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 35.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void startApp() async {
    await SplashScreenController().checkAuth().then((value) {
      _timer = Timer.periodic(
          Duration(seconds: 3),
          (t) => Navigator.of(context, rootNavigator: true).pushReplacement(
                MaterialPageRoute(
                    builder: (_) => (value == true) ? Home() : Login()),
              ));
    });
  }
}
