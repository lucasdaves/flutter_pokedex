import 'package:flutter/material.dart';

class HomeTextField extends StatelessWidget {
  final String textLabel;
  final double width;
  final double height;

  HomeTextField({
    required this.textLabel,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();

    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Colors.white, // set border color
              width: 1.0), // set border width
          borderRadius: BorderRadius.all(Radius.circular(90.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!.withOpacity(1),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(width * 0.1, 0, 0, 0),
          child: TextField(
            controller: _textController,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
              hintText: textLabel,
              suffixIcon: Icon(Icons.search),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
