import 'package:flutter/material.dart';

class ResultBar extends StatelessWidget implements PreferredSizeWidget {
  final String barCounter;
  final double barHeight;
  final Color barColor;
  final String barTitle;
  final Color barTitleColor;
  final double barTitleSize;
  final String barSubTitle;
  final Color barSubTitleColor;
  final double barSubTitleSize;
  final Color barIconColor;
  final double barIconSize;
  final bool pagination;
  final Function leftAction;
  final Function rightAction;

  ResultBar({
    required this.barCounter,
    required this.barHeight,
    required this.barColor,
    required this.barTitle,
    required this.barTitleColor,
    required this.barTitleSize,
    required this.barSubTitle,
    required this.barSubTitleColor,
    required this.barSubTitleSize,
    required this.barIconColor,
    required this.barIconSize,
    required this.pagination,
    required this.leftAction,
    required this.rightAction,
  });

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    if (pagination == true) {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: barIconColor, size: barIconSize),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, deviceWidth * 0.02, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_circle_down_sharp,
                      color: barIconColor, size: barIconSize),
                  onPressed: () => leftAction(),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      deviceWidth * 0.02, deviceHeight * 0.01, 0, 0),
                  child: Text(
                    barCounter,
                    style: TextStyle(
                      color: barTitleColor,
                      fontSize: barTitleSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_circle_up_sharp,
                      color: barIconColor, size: barIconSize),
                  onPressed: () => rightAction(),
                ),
              ],
            ),
          ),
        ],
        backgroundColor: barColor,
        centerTitle: false,
        toolbarHeight: barHeight,
        title: ListTile(
          title: Text(
            barTitle,
            style: TextStyle(
              color: barTitleColor,
              fontSize: barTitleSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            barSubTitle,
            style: TextStyle(
              color: barSubTitleColor,
              fontSize: barSubTitleSize,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      );
    } else {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: barIconColor, size: barIconSize),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: barColor,
        centerTitle: false,
        toolbarHeight: barHeight,
        title: ListTile(
          title: Text(
            barTitle,
            style: TextStyle(
              color: barTitleColor,
              fontSize: barTitleSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            barSubTitle,
            style: TextStyle(
              color: barSubTitleColor,
              fontSize: barSubTitleSize,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      );
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(barHeight);
}
