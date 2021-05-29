import 'package:flutter/material.dart';

class ResultBar extends StatelessWidget implements PreferredSizeWidget {
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

  ResultBar({
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
  });

  @override
  Widget build(BuildContext context) {
    if (pagination == true) {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: barIconColor, size: barIconSize),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_left_rounded,
                color: barIconColor, size: barIconSize),
            onPressed: () => Navigator.pop(context),
          ),
          IconButton(
            icon: Icon(Icons.arrow_right_rounded,
                color: barIconColor, size: barIconSize),
            onPressed: () => Navigator.pop(context),
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
