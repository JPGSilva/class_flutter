import 'dart:async';
import 'dart:js';

import 'package:classe/routes/home_route.dart';
import 'package:classe/routes/welcome_route.dart';
import 'package:flutter/material.dart';
import '../app_preferences/app_preferences.dart';
import '../widgets/circular_image_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenRoute extends StatefulWidget {
  const SplashScreenRoute({super.key});

  @override
  _SplashScreenRouteState createState() => _SplashScreenRouteState();
}

_whereToNavigate({required bool welcomeRead}) {
  if (welcomeRead)
    // ignore: curly_braces_in_flow_control_structures
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomeRoute()));
  else
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WelcomeRoute()),
    );
}

class _SplashScreenRouteState extends State<SplashScreenRoute> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        AppPreferences.getWelcomeRead().then((status) async {
          await _whereToNavigate(welcomeRead: status);
        });
      });
    });
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularImageWidget(
          imageProvider: const AssetImage(
            'assets/images/splashscreen.png',
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20.0, bottom: 20),
          child: Text(
            'Aguarde....',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 100, right: 100),
          child: LinearProgressIndicator(
            backgroundColor: Colors.blue[200],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[900]!),
          ),
        ),
      ],
    );
  }
}
