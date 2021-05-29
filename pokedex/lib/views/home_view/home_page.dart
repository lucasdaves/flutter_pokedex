import 'package:flutter/material.dart';
import 'package:pokedex/views/home_view/home_body.dart';

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
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
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
              HomeBody(
                deviceWidth: deviceWidth,
                deviceHeight: deviceHeight,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
