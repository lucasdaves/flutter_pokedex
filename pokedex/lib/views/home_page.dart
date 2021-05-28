import 'package:flutter/material.dart';
import 'package:pokedex/models/home_functions.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: deviceWidth,
        height: deviceHeight,
        color: Colors.redAccent.shade400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: deviceWidth * 0.8,
              height: deviceHeight * 0.25,
              child: Image(
                fit: BoxFit.contain,
                image: AssetImage('images/logo.png'),
              ),
            ),
            HomeFunctions(
              deviceWidth: deviceWidth,
              deviceHeight: deviceHeight,
            ),
          ],
        ),
      ),
    );
  }
}
