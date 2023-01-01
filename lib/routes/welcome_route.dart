import 'package:classe/app_preferences/app_preferences.dart';
import 'package:classe/routes/home_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WelcomeRoute extends StatefulWidget {
  const WelcomeRoute({super.key});




  

  @override
  _WelcomeRouteState createState() => _WelcomeRouteState();
}

class _WelcomeRouteState extends State<WelcomeRoute> {
  bool _checkBoxIsChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Bem-vindo',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const Text(
                      'Marcar como lido',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Checkbox(
                      value: _checkBoxIsChecked,
                      onChanged: (status) {
                        setState(() {
                          this._checkBoxIsChecked = status!;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    AppPreferences.setWelcomeRead(status: this._checkBoxIsChecked);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeRoute()),
                    );
                  },
                  child: Text('Avançar', style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
